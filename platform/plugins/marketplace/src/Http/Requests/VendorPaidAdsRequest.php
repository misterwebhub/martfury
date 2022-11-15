<?php

namespace Botble\Marketplace\Http\Requests;

use Botble\Support\Http\Requests\Request;
use MarketplaceHelper;

class VendorPaidAdsRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'          => 'required',
            'start_date'    => 'required',
            'end_date'      => 'required',
            'ads_hour'      => 'required',
            'ads_space_id'  => 'required',
            'total_amount' => 'required',
            'banner_image_input' => 'required',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'amount.max' => __('The balance is not enough for withdrawal'),
        ];
    }
}
