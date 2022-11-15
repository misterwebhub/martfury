<?php

namespace Botble\Ads\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;

class PaidAdsManagements extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'paid_ads_managements';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'ads_space_id',
        'price_per_hour',
        'status'
    ];

    // /**
    //  * @var string[]
    //  */
    // protected $dates = [
    //     'expired_at',
    // ];

    // /**
    //  * @var array
    //  */
    // protected $casts = [
    //     'status' => BaseStatusEnum::class,
    // ];

    // /**
    //  * @param Builder $query
    //  * @return Builder
    //  */
    // public function scopeNotExpired($query)
    // {
    //     return $query->where(function ($query) {
    //         $query->whereDate('expired_at', '>=', now()->toDateString());
    //     });
    // }

    // /**
    //  * @return string|null
    //  */
    // public function getExpiredAtAttribute($value)
    // {
    //     if (!$value) {
    //         return null;
    //     }

    //     return Carbon::parse($value)->format('m/d/Y');
    // }
}
