<?php

namespace Botble\Marketplace\Tables;

use BaseHelper;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Marketplace\Repositories\Interfaces\VendorPaidAdsInterface;
use Botble\Marketplace\Repositories\Interfaces\WithdrawalInterface;
use Botble\Table\Abstracts\TableAbstract;
use Illuminate\Contracts\Routing\UrlGenerator;
use Yajra\DataTables\DataTables;

class VendorPaidAdsTable extends TableAbstract
{
    /**
     * @var bool
     */
    protected $hasActions = false;

    /**
     * @var bool
     */
    protected $hasFilter = false;

    /**
     * @var bool
     */
    protected $hasCheckbox = false;

    /**
     * WithdrawalTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param WithdrawalInterface $revenueRepository
     */
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, VendorPaidAdsInterface $revenueRepository)
    {
        $this->repository = $revenueRepository;
        parent::__construct($table, $urlGenerator);
    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('price_per_hour', function ($item) {
                return $item->price_per_hour;
            })
            ->editColumn('ads_space_id', function ($item) {
                return $this->get_space_name($item->ads_space_id);
            })
            ->addColumn('operations', function ($item) {
                return '<a href="' . url('vendor/ads-managements/edit/' . $item->id) . '" class="btn btn-icon btn-sm btn-success" data-bs-toggle="tooltip" data-bs-original-title="Show">
                <i class="fa fa-edit"></i>
            </a>';
            });


        return $this->toJson($data);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()
            ->select([
                'id',
                'name',
                'ads_space_id',
                'start_date',
                'end_date',
                'ads_hour',
                'total_amount',
                'banner_image',
                'status',
                'created_at',
                'updated_at',
            ])
            ->where('customer_id', auth('customer')->id());

        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'         => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'name'     => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.ads_name'),
            ],
            'ads_space_id' => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.ads_space_id'),
            ],
            'start_date'     => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.start_date'),
                'width' => '100px',
            ],
            'end_date'     => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.end_date'),
                'width' => '100px',
            ],
            'ads_hour'     => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.ads_hour'),
                'width' => '100px',
            ],

            'total_amount' => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.total_amount'),
            ],
            'created_at' => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.created_at'),
            ],
            
            'status' => [
                'title' => trans('plugins/marketplace::vendor_paid_ads.forms.status'),
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function getDefaultButtons(): array
    {
        return [
            // 'export',
            'reload',
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return $this->addCreateButton(route('marketplace.vendor.ads-managements.create'));
    }
    function get_space_name($space_id)
    {
        $ads_space_obj = AdsSpaceManagements::where('id', $space_id)->first('name');
        return isset($ads_space_obj->name) ? $ads_space_obj->name : '';
    }
}
