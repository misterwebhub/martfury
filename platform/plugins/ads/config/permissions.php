<?php

return [
    [
        'name' => 'Ads',
        'flag' => 'ads.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'ads.create',
        'parent_flag' => 'ads.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'ads.edit',
        'parent_flag' => 'ads.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'ads.destroy',
        'parent_flag' => 'ads.index',
    ],
    [
        'name' => 'Ads Managements',
        'flag' => 'ads_managements.index',
        'parent_flag' => 'ads.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'ads_managements.create',
        'parent_flag' => 'ads_managements.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'ads_managements.edit',
        'parent_flag' => 'ads_managements.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'ads_managements.destroy',
        'parent_flag' => 'ads_managements.index',
    ],
    [
        'name' => 'Ads Space Managements',
        'flag' => 'ads.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'ads_space_managements.create',
        'parent_flag' => 'ads_space_managements.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'ads_space_managements.edit',
        'parent_flag' => 'ads_space_managements.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'ads_space_managements.destroy',
        'parent_flag' => 'ads_space_managements.index',
    ],
];
