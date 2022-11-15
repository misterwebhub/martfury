<?php

namespace Botble\CustomModule\Forms\Fields;

use Kris\LaravelFormBuilder\Fields\FormField;

class CategoryMultiField extends FormField
{
    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        return 'plugins/CustomModule::categories.categories-multi';
    }
}
