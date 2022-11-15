<?php

namespace Botble\Marketplace\Forms;

use AdsManagements;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\Marketplace\Forms\Fields\CustomImageField;
use Botble\Marketplace\Forms\Fields\CustomImagesField;
use Botble\Marketplace\Http\Requests\VendorEditWithdrawalRequest;
use Botble\Marketplace\Http\Requests\VendorPaidAdsRequest;
use Botble\Marketplace\Http\Requests\VendorWithdrawalRequest;
use Botble\Marketplace\Models\VendorPaidAds;
use Botble\Marketplace\Models\Withdrawal;
use Html;
use MarketplaceHelper;

class VendorPaidAdsForm extends FormAbstract
{

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        $fee = MarketplaceHelper::getSetting('fee_withdrawal', 0);

        $exists = $this->getModel() && $this->getModel()->id;

        $actionButtons = view('plugins/marketplace::withdrawals.forms.actions')->render();
        if ($exists) {
            $fee = null;
            if (!$this->getModel()->vendor_can_edit) {
                $actionButtons = ' ';
            }
        }

        $model = auth('customer')->user();
        if ($exists) {
            $model = $this->getModel();
        }

        $disabled = ['disabled' => 'disabled'];

        $this
            ->setupModel(new VendorPaidAds)
            ->setFormOption('enctype', 'multipart/form-data')
            ->setValidatorClass(VendorPaidAdsRequest::class)
            ->setFormOption('template', MarketplaceHelper::viewPath('dashboard.forms.base'))
            ->withCustomFields()
            ->addCustomField('customImage', CustomImageField::class)
            ->add('name', 'text', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.ads_name'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('banner_type', 'customSelect', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.banner_type'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'id'        => 'banner_type',
                    'class'     => 'form-control select-search-full',
                ],
                'choices'    => ['Header', 'Product'],
            ])
            ->add('ad_title', 'text', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.ad_title'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('page_name', 'text', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.page_name'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('start_date', 'datetime-local', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.start_date'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('end_date', 'datetime-local', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.end_date'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('ads_hour', 'number', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.ads_hour'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('ads_space_id', 'customSelect', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.ads_space_id'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'id'        => 'banner_type',
                    'class'     => 'form-control select-search-full',
                ],
                'choices'    => $this->get_all_space_id(),
            ])
            ->add('price_per_hour', 'number', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.price_per_hour'),
                'label_attr' => ['class' => 'control-label']
            ])
            ->add('banner_image', 'file', [
                'label'      => trans('plugins/marketplace::vendor_paid_ads.forms.banner_image'),
                'label_attr' => ['class' => 'control-label'],
                'value' => 'yes'

            ]);
        $this
            ->setBreakFieldPoint('cancel')
            ->setActionButtons($actionButtons);
    }

    function get_all_space_id()
    {
        $space_array = array();
        $space_list = AdsSpaceManagements::where(['status' => 'published'])->get(['id', 'name']);
        foreach ($space_list as $value) {
            $space_array[$value->id] = $value->name;
        }
        return $space_array;
    }
    
}
