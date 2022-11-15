<?php

namespace Botble\Ads\Tables;

use Auth;
use BaseHelper;
use Botble\Ads\Models\Ads;
use Botble\Ads\Models\AdsManagements;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Ads\Models\PaidAdsManagements;
use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;
use Botble\Ads\Repositories\Interfaces\PaidAdsManagementsInterface;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\Customer;
use Botble\Marketplace\Models\VendorPaidAds;
use Botble\Table\Abstracts\TableAbstract;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use RvMedia;
use Yajra\DataTables\DataTables;

class PaidAdsManagementsTable extends TableAbstract
{

    /**
     * @var bool
     */
    protected $hasActions = true;

    /**
     * @var bool
     */
    protected $hasFilter = true;

    /**
     * AdsTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param AdsInterface $adsRepository
     */
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, VendorPaidAds $adsRepository)
    {
        $this->repository = $adsRepository;
        parent::__construct($table, $urlGenerator);

        if (!Auth::user()->hasAnyPermission(['paid_ads_managements.edit'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function ($item) {
                if (!Auth::user()->hasPermission('paid_ads_managements.edit')) {
                    return $item->name;
                }
                return Html::link(route('paid_ads_managements.edit', $item->id), $item->name);
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('banner_image', function ($item) {
                return Html::image(
                    RvMedia::getImageUrl($item->banner_image, 'vendorads', false, RvMedia::getDefaultImage()),
                    $item->banner_image,
                    ['width' => 50]
                );
            })
            ->editColumn('ads_space_id', function ($item) {
                return $this->get_ads_space_name($item->ads_space_id);
            })
            ->editColumn('customer_id', function ($item) {
                return $this->get_customer_name($item->customer_id);
            })
            ->editColumn('status', function ($item) {
                return $item->status;
            });

        // if (function_exists('shortcode')) {
        //     $data = $data->editColumn('key', function ($item) {
        //         return generate_shortcode('ads', ['key' => $item->key]);
        //     });
        // }
        $data = $data->addColumn('operations', function ($item) {
            return $this->getOperations('paid_ads_managements.edit', '', $item);
        });

        return $this->toJson($data);
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

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()->select([
            'mp_vendor_paid_ads.id',
            'mp_vendor_paid_ads.banner_image',
            'mp_vendor_paid_ads.name',
            'mp_vendor_paid_ads.customer_id',
            'mp_vendor_paid_ads.ads_space_id',
            'mp_vendor_paid_ads.start_date',
            'mp_vendor_paid_ads.end_date',
            'mp_vendor_paid_ads.ads_hour',
            'mp_vendor_paid_ads.total_amount',
            'mp_vendor_paid_ads.link',
            'mp_vendor_paid_ads.status',
            'mp_vendor_paid_ads.created_at',
        ]);

        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'         => [
                'name'  => 'mp_vendor_paid_ads.id',
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'banner_image'       => [
                'name'  => 'mp_vendor_paid_ads.image',
                'title' => trans('core/base::tables.image'),
                'class' => 'text-start',
            ], 'name'       => [
                'name'  => 'mp_vendor_paid_ads.name',
                'title' => trans('core/base::tables.name'),
                'class' => 'text-start',
            ],
            'ads_space_id'       => [
                'name'  => 'mp_vendor_paid_ads.ads_space_id',
                'title' => trans('core/base::tables.ads_space'),
                'class' => 'text-start',
            ],
            'customer_id'       => [
                'name'  => 'mp_vendor_paid_ads.customer_id',
                'title' => 'Vendor Name',
                'class' => 'text-start',
            ],
            'start_date'       => [
                'name'  => 'mp_vendor_paid_ads.start_date',
                'title' => 'Start Date',
                'class' => 'text-start',
            ],
            'end_date'       => [
                'name'  => 'mp_vendor_paid_ads.end_date',
                'title' => 'End Date',
                'class' => 'text-start',
            ],
            'ads_hour'       => [
                'name'  => 'mp_vendor_paid_ads.ads_hour',
                'title' => 'Ads Hour',
                'class' => 'text-start',
            ],
            'total_amount'       => [
                'name'  => 'mp_vendor_paid_ads.total_amount',
                'title' => 'Total Amount',
                'class' => 'text-start',
            ],
            'status'     => [
                'name'  => 'mp_vendor_paid_ads.status',
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
            ],
            'created_at'     => [
                'name'  => 'mp_vendor_paid_ads.created_at',
                'title' => 'Created At',
                'width' => '100px',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return;
        // $buttons = $this->addCreateButton(route('paid_ads_managements.create'), 'paid_ads_managements.create');

        // return apply_filters(BASE_FILTER_TABLE_BUTTONS, $buttons, AdsManagements::class);
    }

    /**
     * {@inheritDoc}
     */
    public function bulkActions(): array
    {
        return [];
        // return $this->addDeleteAction(route('paid_ads_managements.deletes'), 'paid_ads_managements.destroy', parent::bulkActions());
    }

    /**
     * @return array
     */
    public function getFilters(): array
    {
        return $this->getBulkChanges();
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'paid_ads_managements.name'       => [
                'title'    => trans('core/base::tables.name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'paid_ads_managements.status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'select',
                'validate' => 'required',
            ]
        ];
    }
}
