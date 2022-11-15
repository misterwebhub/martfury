<?php

namespace Botble\Ads\Repositories\Caches;

use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;

class AdsManagementsCacheDecorator extends CacheAbstractDecorator implements AdsManagementsInterface
{
    /**
     * {@inheritDoc}
     */
    public function getAll()
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
