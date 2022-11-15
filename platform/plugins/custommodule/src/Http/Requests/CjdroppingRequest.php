<?php

namespace Botble\CustomModule\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\CustomModule\Supports\PostFormat;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CjdroppingRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
            'name'        => 'required|max:255',
            'description' => 'max:400',
            'categories'  => 'required',
            'status'      => Rule::in(BaseStatusEnum::values()),
        ];

        $postFormats = PostFormat::getPostFormats(true);

        if (count($postFormats) > 1) {
            $rules['format_type'] = Rule::in(array_keys($postFormats));
        }

        return $rules;
    }
}
