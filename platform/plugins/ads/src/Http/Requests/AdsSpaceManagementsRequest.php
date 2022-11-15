<?php

namespace Botble\Ads\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;
use AdsManager;

class AdsSpaceManagementsRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'     => 'required',
            'price_per_hour'     => 'required',
            'image_label'     => 'required',
            'status'   => 'required',
        ];
    }
}
