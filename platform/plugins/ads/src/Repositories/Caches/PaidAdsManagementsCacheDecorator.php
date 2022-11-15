<?php

namespace Botble\Ads\Repositories\Caches;

use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;
use Botble\Ads\Repositories\Interfaces\PaidAdsManagementsInterface;

class PaidAdsManagementsCacheDecorator extends CacheAbstractDecorator implements PaidAdsManagementsInterface
{
    /**
     * {@inheritDoc}
     */
    public function getAll()
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
