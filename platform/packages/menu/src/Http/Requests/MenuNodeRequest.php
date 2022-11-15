<?php

namespace Botble\Menu\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class MenuNodeRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'data.menu_id' => 'required',
            'data.title'   => 'required',
        ];
    }

    /**
     * @return array
     */
    public function attributes()
    {
        return [
            'data.menu_id' => trans('packages/menu::menu.menu_id'),
            'data.title'   => trans('packages/menu::menu.title'),
        ];
    }
}
