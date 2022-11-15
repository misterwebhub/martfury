<?php

namespace Botble\Ecommerce\Http\Requests;

use Illuminate\Support\Arr;

class SaveCheckoutInformationRequest extends CheckoutRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     *
     */
    public function rules()
    {
        $rules = parent::rules();

        Arr::forget($rules, ['payment_method', 'shipping_method', 'amount']);

        return $rules;
    }
}
