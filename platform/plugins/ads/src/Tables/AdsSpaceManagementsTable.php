<?php

namespace Botble\Ads\Tables;

use Auth;
use BaseHelper;
use Botble\Ads\Models\AdsManagements;
use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Ads\Repositories\Interfaces\AdsSpaceManagementsInterface;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Table\Abstracts\TableAbstract;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use RvMedia;
use Yajra\DataTables\DataTables;

class AdsSpaceManagementsTable extends TableAbstract
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
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, AdsSpaceManagementsInterface $adsRepository)
    {
        $this->repository = $adsRepository;
        parent::__construct($table, $urlGenerator);

        if (!Auth::user()->hasAnyPermission(['ads_space_managements.edit', 'ads_space_managements.destroy'])) {
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
                if (!Auth::user()->hasPermission('ads_space_managements.edit')) {
                    return $item->name;
                }
                return Html::link(route('ads_space_managements.edit', $item->id), $item->name);
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('status', function ($item) {
                return $item->status;
            })
            ->editColumn('price_per_hour', function ($item) {
                return $item->price_per_hour;
            });

        // if (function_exists('shortcode')) {
        //     $data = $data->editColumn('key', function ($item) {
        //         return generate_shortcode('ads', ['key' => $item->key]);
        //     });
        // }

        $data = $data->addColumn('operations', function ($item) {
            return $this->getOperations('ads_space_managements.edit', '', $item);
        });

        return $this->toJson($data);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()->select([
            'ads_space_managements.id',
            'ads_space_managements.name',
            'ads_space_managements.price_per_hour',
            'ads_space_managements.status',
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
                'name'  => 'ads_space_managements.id',
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'name'       => [
                'name'  => 'ads_space_managements.name',
                'title' => trans('core/base::tables.name'),
                'class' => 'text-start',
            ],
            'price_per_hour'       => [
                'name'  => 'ads_space_managements.price_per_hour',
                'title' => trans('core/base::tables.price_per_hour'),
                'class' => 'text-start',
            ],
            'status'     => [
                'name'  => 'ads_space_managements.status',
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        // $buttons = $this->addCreateButton(route('ads_space_managements.create'), 'ads_space_managements.create');

        // return apply_filters(BASE_FILTER_TABLE_BUTTONS, $buttons, AdsManagements::class);
    }

    /**
     * {@inheritDoc}
     */
    // public function bulkActions(): array
    // {
    //     return $this->addDeleteAction(route('ads_space_managements.deletes'), 'ads_space_managements.destroy', parent::bulkActions());
    // }

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
            'ads_space_managements.name'       => [
                'title'    => trans('core/base::tables.name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'ads_space_managements.status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'select',
                'validate' => 'required',
            ]
        ];
    }
}
