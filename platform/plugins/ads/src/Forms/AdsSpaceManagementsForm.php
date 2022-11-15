<?php

namespace Botble\Ads\Forms;

use AdsManager;
use Botble\Ads\Http\Requests\AdsManagementsRequest;
use Botble\Ads\Http\Requests\AdsRequest;
use Botble\Ads\Http\Requests\AdsSpaceManagementsRequest;
use Botble\Ads\Models\Ads;
use Botble\Ads\Models\AdsManagements;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;

class AdsSpaceManagementsForm extends FormAbstract
{

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        $this
            ->setupModel(new AdsSpaceManagements)
            ->setValidatorClass(AdsSpaceManagementsRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label'      => trans('core/base::forms.name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('price_per_hour', 'number', [
                'label'      => trans('core/base::forms.price_per_hour'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.price_per_hour'),
                    'data-counter' => 120,
                ],
            ])
            ->add('image_label', 'text', [
                'label'      => trans('core/base::forms.image_label'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.image_label'),
                    'data-counter' => 250,
                ],
            ])
            ->add('status', 'customSelect', [
                'label'      => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'form-control select-full',
                ],
                'choices'    => BaseStatusEnum::labels(),
            ]);
    }
}
