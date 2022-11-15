<?php

namespace Botble\Marketplace\Http\Controllers\Fronts;

use Assets;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Marketplace\Enums\WithdrawalStatusEnum;
use Botble\Marketplace\Forms\VendorPaidAdsForm;
use Botble\Marketplace\Forms\VendorWithdrawalForm;
use Botble\Marketplace\Http\Requests\VendorEditWithdrawalRequest;
use Botble\Marketplace\Http\Requests\VendorPaidAdsRequest;
use Botble\Marketplace\Http\Requests\VendorWithdrawalRequest;
use Botble\Marketplace\Models\VendorPaidAds;
use Botble\Marketplace\Repositories\Interfaces\VendorPaidAdsInterface;
use Botble\Marketplace\Repositories\Interfaces\WithdrawalInterface;
use Botble\Marketplace\Tables\VendorPaidAdsTable;
use Botble\Marketplace\Tables\VendorWithdrawalTable;
use Botble\Marketplace\Tables\WithdrawalTable;
// use Botble\Support\Http\Requests\Request;
use Illuminate\Http\Request;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\View;
use MarketplaceHelper;
use Throwable;
use RvMedia;

class VendorPaidAdsController
{
    /**
     * @var WithdrawalInterface
     */
    protected $vendorPaidAdsRepository;
    /**
     * WithdrawalController constructor.
     * @param WithdrawalInterface $vendorPaidAdsRepository
     */
    public function __construct(VendorPaidAdsInterface $vendorPaidAdsRepository)
    {
        $this->vendorPaidAdsRepository = $vendorPaidAdsRepository;
    }

    /**
     * @param WithdrawalTable $table
     * @return JsonResponse|View|Response
     */
    public function index(VendorPaidAdsTable $table)
    {
        page_title()->setTitle(__('Ads Management'));

        return $table->render(MarketplaceHelper::viewPath('dashboard.table.base'));
    }

    /**
     * @param FormBuilder $formBuilder
     * @return BaseHttpResponse|string
     */
    public function create(FormBuilder $formBuilder, BaseHttpResponse $response)
    {
        page_title()->setTitle(__('Paid Ads request'));

        Assets::addScriptsDirectly([
            'vendor/core/core/base/libraries/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js'
        ])->addStylesDirectly([
            'vendor/core/core/base/libraries/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css'
        ])->addScripts(['moment']);

        $slof_info_array = $this->get_booking_slot_info(0);
        $banner_type = ['header', 'footer'];
        $send_data = ['banner_type' => $banner_type];
        $user = auth('customer')->user();
        $store = auth('customer')->user()->store;
        return MarketplaceHelper::view('dashboard.paid_ads_manage', compact('store',  'slof_info_array'));
    }

    /**
     * @param VendorWithdrawalRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(VendorPaidAdsRequest $request, BaseHttpResponse $response)
    {
        $start_date_val = date('Y-m-d H:i:s', strtotime($request->start_date));
        $end_date_val = date('Y-m-d H:i:s', strtotime($request->end_date));
        $end_date_val = date('Y-m-d H:i:s', strtotime($end_date_val . "-1 minutes"));
        $request->merge(['start_date' => $start_date_val, 'end_date' => $end_date_val]);

        if ($request->hasFile('banner_image_input')) {
            $result = RvMedia::handleUpload($request->file('banner_image_input'), 0, 'vendorads');
            if (!$result['error']) {
                $file = $result['data'];
                $request->merge(['banner_image' => $file->url]);
            }
        }
        if (isset($request->ads_paid_id) && $request->ads_paid_id != '') {
            $request_array = $request->all();
            unset($request_array['_token']);
            unset($request_array['ads_paid_id']);
            unset($request_array['banner_image_input']);
            $condition = ['id' => $request->ads_paid_id];
            $this->vendorPaidAdsRepository->update($condition, $request_array);
        } else {
            $request->merge(['customer_id' => auth('customer')->id()]);
            $this->vendorPaidAdsRepository->create($request->input());
        }
        return redirect('/vendor/ads-managements');

        // return $response
        //     ->setPreviousUrl(route('marketplace.vendor.ads-managements.index'))
        //     ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder)
    {
        page_title()->setTitle(__('Update Paid Ads #' . $id));
        $slof_info_array = $this->get_booking_slot_info($id);
        Assets::addScriptsDirectly([
            'vendor/core/core/base/libraries/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js'
        ])->addStylesDirectly([
            'vendor/core/core/base/libraries/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css'
        ])->addScripts(['moment']);
        $store = auth('customer')->user()->store;
        $ads_info = $this->get_paid_ads_info($id);
        $ads_paid_id = $id;
        return MarketplaceHelper::view('dashboard.paid_ads_manage', compact('store', 'ads_info', 'ads_paid_id', 'slof_info_array'));
    }

    /**
     * @param int $id
     * @param VendorEditWithdrawalRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, VendorPaidAdsRequest $request, BaseHttpResponse $response)
    {
        dd($request->input());
        $condition = ['id' => $id];
        $this->vendorPaidAdsRepository->update($condition, $request->input());
        return $response
            ->setPreviousUrl(route('marketplace.vendor.ads-managements.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function show($id, FormBuilder $formBuilder)
    {
        $withdrawal = $this->vendorPaidAdsRepository
            ->getFirstBy([
                ['id', '=', $id],
                ['customer_id', '=', auth('customer')->id()],
                ['status', '!=', WithdrawalStatusEnum::PENDING],
            ]);

        if (!$withdrawal) {
            abort(404);
        }

        page_title()->setTitle(__('View withdrawal request #' . $id));

        return $formBuilder->create(VendorWithdrawalForm::class, ['model' => $withdrawal])->renderForm();
    }

    function get_paid_ads_info($id)
    {
        $ads_info = VendorPaidAds::where(['id' => $id])->first();
        return $ads_info;
    }

    public function validate_date_range(Request $request)
    {
        $ads_id = $request->ads_id;
        $ads_space_id = $request->ads_space_id;
        $start_date = date("Y-m-d H:i:s", strtotime($request->start_date));
        $end_date = date("Y-m-d H:i:s", strtotime($request->end_date));
        $ads_management_table_name = (new VendorPaidAds())->getTable();
        $query = "SELECT * FROM " . $ads_management_table_name . " WHERE  ((('" . $start_date . "' BETWEEN start_date AND end_date) OR ('" . $end_date . "' BETWEEN start_date AND end_date)) or (start_date > '" . $start_date . "' AND  end_date < '" . $end_date . "'))  AND id !=" . $ads_id . " AND ads_space_id = " . $ads_space_id;
        $get_booking_slot = DB::select($query);
        return $get_booking_slot;
    }
    /**
     * Get Booking slot info
     */
    function get_booking_slot_info($id)
    {
        if ($id != 0) {
            $slot_info = VendorPaidAds::where('end_date', '>=', DB::raw('DATE_FORMAT(NOW(),"%Y-%m-%d %H:%i:s")'))->orderBy('start_date', 'ASC')->whereNotIn('id', [$id])->get();
        } else {
            $slot_info = VendorPaidAds::where('end_date', '>=', DB::raw('DATE_FORMAT(NOW(),"%Y-%m-%d %H:%i:s")'))->orderBy('start_date', 'ASC')->get();
        }
        return $slot_info;
    }

    /**
     * function for available slot via date
     */
    function get_available_slot_info(Request $request)
    {
        date_default_timezone_set(config('app.second_timezone'));

        $response = array();
        $ads_space_id = $request->ads_space_id;
        $request_choose_date = $request->choose_date;
        $choose_date = date("Y-m-d", strtotime($request_choose_date));
        $current_date = date("Y-m-d");
        if ($choose_date == $current_date) {
            $day_hour = date("H");
        } else {
            $day_hour = date("00");
        }

        $total_day_hour = 24;
        $space_id_info = $this->get_ads_space_info($ads_space_id);
        if ($space_id_info['status'] == true) {
            $image_limit = $space_id_info['image_limit'];
            $ads_management_table_name = (new VendorPaidAds())->getTable();
            $slot_info_array = [];
            for ($i = $day_hour; $i <  $total_day_hour; $i++) {
                $hour_string = (string)$i;
                if (strlen($hour_string) == 1) {
                    $hour_string = "0" . $hour_string;
                }
                $time_string  = $hour_string . ":00:00";
                $date_hour = date("Y-m-d H:i", strtotime($choose_date . " " . $time_string));
                $query = "SELECT * FROM " . $ads_management_table_name . " WHERE '" . $date_hour . "' BETWEEN start_date AND end_date AND ads_space_id=" . $ads_space_id;
                $slot_db_query = DB::select($query);
                if (count($slot_db_query) == $image_limit) {
                    $slot_info_array[] = array('is_slot_booked' => true, 'date_hour' => $date_hour, 'slot_info' => $slot_db_query);
                } else {
                    $slot_info_array[] = array('is_slot_booked' => false, 'date_hour' => $date_hour,  'slot_info' => $slot_db_query);
                }
            }
            $response = ['status' => true, 'data' => $slot_info_array];
        } else {
            $response = ['status' => false, 'message' => 'invalid Ads Space ID'];
        }
        return $response;
    }

    /**Function for get ads space info */
    function get_ads_space_info($ads_space_id)
    {
        $ads_space_info = AdsSpaceManagements::where(['id' => $ads_space_id, 'status' => 'published'])->first();
        if (!empty($ads_space_info)) {
            return ['status' => true, 'image_limit' => $ads_space_info->image_limit];
        } else {
            return ['status' => false];
        }
    }
}