<?php

use Botble\CustomModule\Models\Category;
use Botble\CustomModule\Models\Post;
use Botble\CustomModule\Models\Tag;

Route::group(['namespace' => 'Botble\CustomModule\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix() . '/CustomModule', 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'posts', 'as' => 'posts.'], function () {
            Route::resource('', 'PostController')
                ->parameters(['' => 'post']);

            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'PostController@deletes',
                'permission' => 'posts.destroy',
            ]);

            Route::get('widgets/recent-posts', [
                'as'         => 'widget.recent-posts',
                'uses'       => 'PostController@getWidgetRecentPosts',
                'permission' => 'posts.index',
            ]);
        });
		 Route::group(['prefix' => 'cjdropping', 'as' => 'cjdropping.'], function () {
            Route::resource('', 'CjdroppingController')
                ->parameters(['' => 'cjdropping']);
		    
			Route::get('get_products_from_dropship', [
                'as'         => 'get_products_from_dropship',
                'uses'       => 'CjdroppingController@get_products_from_dropship',
                'permission' => 'cjdropping.get_products_from_dropship',
            ]);
			Route::get('get_products_from_dropship_category', [
                'as'         => 'get_products_from_dropship_category',
                'uses'       => 'CjdroppingController@get_products_from_dropship_category',
                'permission' => 'cjdropping.get_products_from_dropship_category',
            ]);
			
			Route::get('ImportProduct', [
                'as'         => 'ImportProduct',
                'uses'       => 'CjdroppingController@ImportProduct',
                'permission' => 'cjdropping.ImportProduct',
            ]);

            
        });

        Route::group(['prefix' => 'categories', 'as' => 'categories.'], function () {
            Route::resource('', 'CategoryController')
                ->parameters(['' => 'category']);

            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'CategoryController@deletes',
                'permission' => 'categories.destroy',
            ]);
        });

        Route::group(['prefix' => 'tags', 'as' => 'tags.'], function () {
            Route::resource('', 'TagController')
                ->parameters(['' => 'tag']);

            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'TagController@deletes',
                'permission' => 'tags.destroy',
            ]);

            Route::get('all', [
                'as'         => 'all',
                'uses'       => 'TagController@getAllTags',
                'permission' => 'tags.index',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            Route::get('search', [
                'as'   => 'public.search',
                'uses' => 'PublicController@getSearch',
            ]);

            if (SlugHelper::getPrefix(Tag::class, 'tag')) {
                Route::get(SlugHelper::getPrefix(Tag::class, 'tag') . '/{slug}', [
                    'as'   => 'public.tag',
                    'uses' => 'PublicController@getTag',
                ]);
            }

            if (SlugHelper::getPrefix(Post::class)) {
                Route::get(SlugHelper::getPrefix(Post::class) . '/{slug}', [
                    'uses' => 'PublicController@getPost',
                ]);
            }

            if (SlugHelper::getPrefix(Category::class)) {
                Route::get(SlugHelper::getPrefix(Category::class) . '/{slug}', [
                    'uses' => 'PublicController@getCategory',
                ]);
            }
        });
    }
});
