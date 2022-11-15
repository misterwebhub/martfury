<?php

namespace Botble\Marketplace\Models;

use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;

class VendorPaidAds extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'mp_vendor_paid_ads';

    /**
     * @var array
     */
    protected $fillable = [
        'customer_id',
        'name',
        'ads_space_id',
        'start_date',
        'end_date',
        'ads_hour',
        'total_amount',
        'banner_image'
    ];

    /**
     * @var array
     */
    // protected $casts = [
    //     'status'    => WithdrawalStatusEnum::class,
    //     'images'    => 'array',
    //     'bank_info' => 'array',
    // ];

    function  get_ads_space_name($ads_space_id)
    {
        $ads_space_name = AdsSpaceManagements::where(['id' => $ads_space_id])->first('name');
        return isset($ads_space_name->name) ? $ads_space_name->name : '';
    }
}
