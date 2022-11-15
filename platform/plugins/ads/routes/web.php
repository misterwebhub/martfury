<?php

Route::group(['namespace' => 'Botble\Ads\Http\Controllers', 'middleware' => ['web']], function () {

    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {

        Route::group(['prefix' => 'ads', 'as' => 'ads.'], function () {
            Route::resource('', 'AdsController')->parameters(['' => 'ads']);
            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'AdsController@deletes',
                'permission' => 'ads.destroy',
            ]);
        });
        Route::group(['prefix' => 'ads_managements', 'as' => 'ads_managements.'], function () {
            Route::resource('', 'AdsManagementsController')->parameters(['' => 'ads_managements']);
            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'AdsManagementsController@deletes',
                'permission' => 'ads_managements.destroy',
            ]);
        });
        Route::group(['prefix' => 'ads_space_managements', 'as' => 'ads_space_managements.'], function () {
            Route::resource('', 'AdsSpaceManagementsController')->parameters(['' => 'ads_space_managements']);
            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'AdsSpaceManagementsController@deletes',
                'permission' => 'ads_space_managements.destroy',
            ]);
        });
        Route::group(['prefix' => 'paid_ads_managements', 'as' => 'paid_ads_managements.'], function () {
            Route::resource('', 'PaidAdsManagementsController')->parameters(['' => 'paid_ads_managements']);
            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'PaidAdsManagementsController@deletes',
                'permission' => 'paid_ads_managements.destroy',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            Route::get('ads-click/{key}', [
                'as'   => 'public.ads-click',
                'uses' => 'PublicController@getAdsClick',
            ]);
        });
    }
});
