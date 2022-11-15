<?php

namespace Botble\Ads\Repositories\Eloquent;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;
use Botble\Ads\Repositories\Interfaces\AdsSpaceManagementsInterface;

class AdsSpaceManagementsRepository extends RepositoriesAbstract implements AdsSpaceManagementsInterface
{
    /**
     * {@inheritDoc}
     */
    public function getAll()
    {
        $data = $this->model;

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
