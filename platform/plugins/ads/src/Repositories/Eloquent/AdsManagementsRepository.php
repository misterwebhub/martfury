<?php

namespace Botble\Ads\Repositories\Eloquent;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;

class AdsManagementsRepository extends RepositoriesAbstract implements AdsManagementsInterface
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
