<?php

namespace Botble\Ads\Forms;

use AdsManager;
use Botble\Ads\Http\Requests\AdsManagementsRequest;
use Botble\Ads\Http\Requests\AdsRequest;
use Botble\Ads\Http\Requests\PaidAdsManagementsRequest;
use Botble\Ads\Models\Ads;
use Botble\Ads\Models\AdsManagements;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Ads\Models\PaidAdsManagements;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\Marketplace\Http\Requests\NoValidationRequest;
use Botble\Marketplace\Http\Requests\VendorPaidAdsRequest;
use Botble\Marketplace\Models\VendorPaidAds;

class PaidAdsManagementsForm extends FormAbstract
{

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        // dd($this->get_active_space_management());
        $this
            ->setupModel(new VendorPaidAds)
            ->setValidatorClass(NoValidationRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label'      => trans('core/base::forms.vendor_ads_name'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
            ])
            ->add('status', 'customSelect', [
                'label'      => trans('core/base::forms.vendor_status'),
                'label_attr' => ['class' => 'control-label '],
                'choices'    => BaseStatusEnum::labels(),
            ])
            ->add('start_date', 'text', [
                'label'      => trans('core/base::forms.vendor_start_date'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
            ])
            ->add('end_date', 'text', [
                'label'      => trans('core/base::forms.vendor_end_date'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ]
            ])
            ->add('ads_hour', 'number', [
                'label'      => trans('core/base::forms.vendor_ads_hour'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
            ])
            ->add('total_amount', 'number', [
                'label'      => trans('core/base::forms.vendor_total_amount'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
            ])
            ->add('link', 'text', [
                'label'      => trans('core/base::forms.vendor_link'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
            ])
            ->add('banner_image', 'mediaImage', [
                'label'      => trans('core/base::forms.image'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'read-only'
                ]
            ])
            ->add('created_at', 'text', [
                'label'      => trans('core/base::forms.vendor_created_at'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
                'choices'    => BaseStatusEnum::labels(),
            ])
            ->add('updated_at', 'text', [
                'label'      => trans('core/base::forms.vendor_updated_at'),
                'label_attr' => ['class' => 'control-label '],
                'attr'       => [
                    'disabled',
                ],
            ]);
    }
    /**
     * function for get all active ads space management
     */
    function get_active_space_management()
    {
        $response = array();
        $getAllSpaces = AdsSpaceManagements::where(['status' => 'published'])->get(['id', 'name']);
        foreach ($getAllSpaces as $space) {
            $key = (string) $space->id;
            $response[$key] = $space->name;
        }
        return $response;
    }

    /**
     * function to get ads Space Name via ads Space Id
     */
    function get_ads_space_name($ads_space_id)
    {
        $get_space_name = AdsSpaceManagements::where(['id' => $ads_space_id])->first(['name']);
        if ($get_space_name != null) {
            return $get_space_name->name;
        }
        return "N/A";
    }
    function get_customer_name($customer_id)
    {
        $get_name = Customer::where(['id' => $customer_id])->first();
        return isset($get_name->name) ? $get_name->name : 'N/A';
    }
}
