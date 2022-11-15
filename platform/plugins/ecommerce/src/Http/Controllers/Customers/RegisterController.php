<?php

namespace Botble\Ecommerce\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use BaseHelper;
use Botble\ACL\Traits\RegistersUsers;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Location\Models\Country;
use EcommerceHelper;
use Exception;
use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\Auth\StatefulGuard;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use Illuminate\View\View;
use Response;
use SeoHelper;
use Theme;
use URL;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * @var CustomerInterface
     */
    protected $customerRepository;

    /**
     * Create a new controller instance.
     *
     * @param CustomerInterface $customerRepository
     */
    public function __construct(CustomerInterface $customerRepository)
    {
        $this->middleware('customer.guest');
        $this->customerRepository = $customerRepository;
    }

    /**
     * Show the application registration form.
     *
     * @return Response
     */
    public function showRegistrationForm()
    {
        SeoHelper::setTitle(__('Register'));

        Theme::breadcrumb()->add(__('Home'), route('public.index'))->add(__('Register'), route('customer.register'));

        if (!session()->has('url.intended')) {
            if (!in_array(url()->previous(), [route('customer.login'), route('customer.register')])) {
                session(['url.intended' => url()->previous()]);
            }
        }

        $countries_list = Country::where(['status' => 'published'])->get();
        return Theme::scope('ecommerce.customers.register', ['countries_list' => $countries_list], 'plugins/ecommerce::themes.customers.register')
            ->render();
    }

    /**
     * Handle a registration request for the application.
     *
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function register(Request $request, BaseHttpResponse $response)
    {
        $this->validator($request->input())->validate();


        do_action('customer_register_validation', $request);

        $customer = $this->create($request->input());

        event(new Registered($customer));

        /**Called AUS Digital Function START custom Code */
        if ($request->is_vendor == "1") {
            $this->aussiedigitalRegisterApi($request->input());
        }
        /**Called AUS Digital Function END custom Code */

        if (EcommerceHelper::isEnableEmailVerification()) {
            return $this->registered($request, $customer)
                ?: $response->setNextUrl(route('customer.login'))
                ->setMessage(__('Please confirm your email address.'));
        }

        $customer->confirmed_at = now();
        $this->customerRepository->createOrUpdate($customer);
        $this->guard()->login($customer);

        return $response->setNextUrl($this->redirectPath())->setMessage(__('Registered successfully!'));
    }

    /**
     * @Aussie Digital Register Api 
     * @function for insert register user info in Aussie Digital 
     */
    public function aussiedigitalRegisterApi($user_data)
    {
        $static_api_url = "https://staging.aussiedigital.io/api/tradezy-register";
        $response = Http::asForm()->post($static_api_url, [
            'name' => $user_data['name'],
            'email' => $user_data['email'],
            'password' => $user_data['password'],
            'confirm_password' =>  $user_data['password'],
            'username' => $user_data['email'],
            'phone_number' => $user_data['shop_phone'] != null ? $user_data['shop_phone'] : '000000000',
            'country_code' => isset($user_data['country']) ? $user_data['country'] : ''
        ]);
        return $response->body();
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $rules = [
            'name'     => 'required|max:255',
            'email'    => 'required|email|max:255|unique:ec_customers',
            'password' => 'required|min:6|confirmed',
        ];

        if (is_plugin_active('captcha') && setting('enable_captcha') && get_ecommerce_setting(
            'enable_recaptcha_in_register_page',
            0
        )) {
            $rules += ['g-recaptcha-response' => 'required|captcha'];
        }

        if (request()->has('agree_terms_and_policy')) {
            $rules['agree_terms_and_policy'] = 'accepted:1';
        }

        $attributes = [
            'name'                   => __('Name'),
            'email'                  => __('Email'),
            'password'               => __('Password'),
            'g-recaptcha-response'   => __('Captcha'),
            'agree_terms_and_policy' => __('Term and Policy'),
        ];

        return Validator::make($data, $rules, [
            'g-recaptcha-response.required' => __('Captcha Verification Failed!'),
            'g-recaptcha-response.captcha'  => __('Captcha Verification Failed!'),
        ], $attributes);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return Customer
     */
    protected function create(array $data)
    {
        return $this->customerRepository->create([
            'name'     => BaseHelper::clean($data['name']),
            'email'    => BaseHelper::clean($data['email']),
            'password' => bcrypt($data['password']),
        ]);
    }

    /**
     * Send the confirmation code to a user.
     *
     * @param Customer $customer
     */
    protected function sendConfirmationToUser($customer)
    {
        // Notify the user
        $notificationConfig = config('plugins.ecommerce.general.customer.notification');
        if ($notificationConfig) {
            $notification = app($notificationConfig);
            $customer->notify($notification);
        }
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return StatefulGuard
     */
    protected function guard()
    {
        return auth('customer');
    }

    /**
     * Confirm a user with a given confirmation code.
     *
     * @param int $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param CustomerInterface $customerRepository
     * @return BaseHttpResponse
     */
    public function confirm($id, Request $request, BaseHttpResponse $response, CustomerInterface $customerRepository)
    {
        if (!URL::hasValidSignature($request)) {
            abort(404);
        }

        $customer = $customerRepository->findOrFail($id);

        $customer->confirmed_at = now();
        $this->customerRepository->createOrUpdate($customer);

        $this->guard()->login($customer);

        return $response
            ->setNextUrl(route('customer.overview'))
            ->setMessage(__('You successfully confirmed your email address.'));
    }

    /**
     * Resend a confirmation code to a user.
     *
     * @param Request $request
     * @param CustomerInterface $customerRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function resendConfirmation(
        Request $request,
        CustomerInterface $customerRepository,
        BaseHttpResponse $response
    ) {
        $customer = $customerRepository->getFirstBy(['email' => $request->input('email')]);

        if (!$customer) {
            return $response
                ->setError()
                ->setMessage(__('Cannot find this customer!'));
        }

        $this->sendConfirmationToUser($customer);

        return $response
            ->setMessage(__('We sent you another confirmation email. You should receive it shortly.'));
    }

    /**
     * @return Factory|View
     */
    public function getVerify()
    {
        return view('plugins/ecommerce::themes.customers.verify');
    }
}