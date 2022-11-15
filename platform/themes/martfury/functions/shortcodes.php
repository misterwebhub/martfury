<?php

use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Repositories\Interfaces\FlashSaleInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use Botble\Faq\Repositories\Interfaces\FaqCategoryInterface;
use Botble\Marketplace\Models\VendorPaidAds;
use Botble\Theme\Supports\ThemeSupport;
use Theme\Martfury\Http\Resources\ProductCategoryResource;
use Theme\Martfury\Http\Resources\ProductCollectionResource;

app()->booted(function () {

    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    if (is_plugin_active('ecommerce')) {
        add_shortcode(
            'featured-product-categories',
            __('Featured Product Categories'),
            __('Featured Product Categories'),
            function ($shortCode) {
                return Theme::partial('short-codes.featured-product-categories', [
                    'title' => $shortCode->title,
                ]);
            }
        );

        shortcode()->setAdminConfig('featured-product-categories', function ($attributes) {
            return Theme::partial('short-codes.featured-product-categories-admin-config', compact('attributes'));
        });

        add_shortcode('featured-products', __('Featured products'), __('Featured products'), function ($shortCode) {
            return Theme::partial('short-codes.featured-products', [
                'title' => $shortCode->title,
                'limit' => $shortCode->limit,
            ]);
        });

        shortcode()->setAdminConfig('featured-products', function ($attributes) {
            return Theme::partial('short-codes.featured-products-admin-config', compact('attributes'));
        });

        add_shortcode('featured-brands', __('Featured Brands'), __('Featured Brands'), function ($shortCode) {
            return Theme::partial('short-codes.featured-brands', [
                'title' => $shortCode->title,
            ]);
        });

        shortcode()->setAdminConfig('featured-brands', function ($attributes) {
            return Theme::partial('short-codes.featured-brands-admin-config', compact('attributes'));
        });

        add_shortcode(
            'product-collections',
            __('Product Collections'),
            __('Product Collections'),
            function ($shortCode) {
                $productCollections = get_product_collections(
                    ['status' => BaseStatusEnum::PUBLISHED],
                    [],
                    ['id', 'name', 'slug']
                );

                return Theme::partial('short-codes.product-collections', [
                    'title'              => $shortCode->title,
                    'productCollections' => ProductCollectionResource::collection($productCollections),
                ]);
            }
        );

        shortcode()->setAdminConfig('product-collections', function ($attributes) {
            return Theme::partial('short-codes.product-collections-admin-config', compact('attributes'));
        });

        add_shortcode('trending-products', __('Trending Products'), __('Trending Products'), function ($shortCode) {
            return Theme::partial('short-codes.trending-products', [
                'title' => $shortCode->title,
            ]);
        });

        shortcode()->setAdminConfig('trending-products', function ($attributes) {
            return Theme::partial('short-codes.trending-products-admin-config', compact('attributes'));
        });

        add_shortcode(
            'product-category-products',
            __('Product category products'),
            __('Product category products'),
            function ($shortCode) {
                $category = app(ProductCategoryInterface::class)->getFirstBy([
                    'status' => BaseStatusEnum::PUBLISHED,
                    'id'     => $shortCode->category_id,
                ], ['*'], [
                    'activeChildren' => function ($query) use ($shortCode) {
                        $query->limit($shortCode->number_of_categories ? (int) $shortCode->number_of_categories : 3);
                    },
                    'activeChildren.slugable',
                ]);

                if (!$category) {
                    return null;
                }

                $limit = $shortCode->limit;

                $category = new ProductCategoryResource($category);
                $category->activeChildren = ProductCategoryResource::collection($category->activeChildren);

                return Theme::partial('short-codes.product-category-products', compact('category', 'limit'));
            }
        );

        shortcode()->setAdminConfig('product-category-products', function ($attributes) {
            $categories = ProductCategoryHelper::getProductCategoriesWithIndent();

            return Theme::partial('short-codes.product-category-products-admin-config', compact('attributes', 'categories'));
        });

        add_shortcode('flash-sale', __('Flash sale'), __('Flash sale'), function ($shortCode) {
            $flashSale = app(FlashSaleInterface::class)->getModel()
                ->where('id', $shortCode->flash_sale_id)
                ->notExpired()
                ->first();

            if (!$flashSale || !$flashSale->products()->count()) {
                return null;
            }

            return Theme::partial('short-codes.flash-sale', [
                'title'     => $shortCode->title,
                'flashSale' => $flashSale,
            ]);
        });

        shortcode()->setAdminConfig('flash-sale', function ($attributes) {
            $flashSales = app(FlashSaleInterface::class)
                ->getModel()
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->notExpired()
                ->get();

            return Theme::partial('short-codes.flash-sale-admin-config', compact('flashSales', 'attributes'));
        });
    }

    if (is_plugin_active('simple-slider')) {
        add_filter(SIMPLE_SLIDER_VIEW_TEMPLATE, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.sliders';
        }, 120);

        add_filter(SHORTCODE_REGISTER_CONTENT_IN_ADMIN, function ($data, $key, $attributes) {
            if (in_array($key, ['simple-slider'])) {
                $ads = app(AdsInterface::class)->getModel()
                    ->where('status', BaseStatusEnum::PUBLISHED)
                    ->notExpired()
                    ->get();

                $maxAds = 2;

                return $data . Theme::partial('short-codes.select-ads-admin-config', compact('ads', 'attributes', 'maxAds'));
            }

            return $data;
        }, 50, 3);

        /**
         * @param array $keys
         * @param string $order
         * @param int $limit
         * @return array
         */
        function get_ads_keys_from_shortcode($shortcode)
        {
            $keys = collect($shortcode->toArray())
                ->sortKeys()
                ->filter(function ($value, $key) use ($shortcode) {
                    return Str::startsWith($key, 'ads_') ||
                        ($shortcode->name == 'theme-ads' && Str::startsWith($key, 'key_'));
                });

            return array_filter($keys->toArray() + [$shortcode->ads]);
        }
    }

    if (is_plugin_active('newsletter')) {
        add_shortcode('newsletter-form', __('Newsletter Form'), __('Newsletter Form'), function ($shortCode) {
            return Theme::partial('short-codes.newsletter-form', [
                'title'       => $shortCode->title,
                'description' => $shortCode->description,
                'subtitle'    => $shortCode->subtitle,
            ]);
        });

        shortcode()->setAdminConfig('newsletter-form', function ($attributes) {
            return Theme::partial('short-codes.newsletter-form-admin-config', compact('attributes'));
        });
    }

    add_shortcode('download-app', __('Download Apps'), __('Download Apps'), function ($shortCode) {
        return Theme::partial('short-codes.download-app', [
            'title'         => $shortCode->title,
            'description'   => $shortCode->description,
            'subtitle'      => $shortCode->subtitle,
            'screenshot'    => $shortCode->screenshot,
            'androidAppUrl' => $shortCode->android_app_url,
            'iosAppUrl'     => $shortCode->ios_app_url,
        ]);
    });

    shortcode()->setAdminConfig('download-app', function ($attributes) {
        return Theme::partial('short-codes.download-app-admin-config', compact('attributes'));
    });

    if (is_plugin_active('faq')) {
        add_shortcode('faq', __('FAQs'), __('FAQs'), function ($shortCode) {
            $categories = app(FaqCategoryInterface::class)
                ->advancedGet([
                    'condition' => [
                        'status' => BaseStatusEnum::PUBLISHED,
                    ],
                    'with'      => [
                        'faqs' => function ($query) {
                            $query->where('status', BaseStatusEnum::PUBLISHED);
                        },
                    ],
                    'order_by'  => [
                        'faq_categories.order'      => 'ASC',
                        'faq_categories.created_at' => 'DESC',
                    ],
                ]);

            return Theme::partial('short-codes.faq', [
                'title'      => $shortCode->title,
                'categories' => $categories,
            ]);
        });

        shortcode()->setAdminConfig('faq', function ($attributes) {
            return Theme::partial('short-codes.faq-admin-config', compact('attributes'));
        });
    }

    add_shortcode('site-features', __('Site features'), __('Site features'), function ($shortcode) {
        return Theme::partial('short-codes.site-features', compact('shortcode'));
    });

    shortcode()->setAdminConfig('site-features', function ($attributes) {
        return Theme::partial('short-codes.site-features-admin-config', compact('attributes'));
    });

    if (is_plugin_active('contact')) {
        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.contact-form';
        }, 120);
    }

    add_shortcode('contact-info-boxes', __('Contact info boxes'), __('Contact info boxes'), function ($shortCode) {
        return Theme::partial('short-codes.contact-info-boxes', ['title' => $shortCode->title]);
    });

    shortcode()->setAdminConfig('contact-info-boxes', function ($attributes) {
        return Theme::partial('short-codes.contact-info-boxes-admin-config', compact('attributes'));
    });

    if (is_plugin_active('ads')) {
        add_shortcode('theme-ads', __('Theme ads'), __('Theme ads'), function ($shortCode) {
            $ads = [];
            $attributes = $shortCode->toArray();

            /**Custom  Ads Logic Start */
            $attributes_key_first = isset($attributes['key_1']) ? $attributes['key_1'] : '';
            $define_ads_short_key_with_space = [
                ['ads_space_id' => 3, 'short_code_key_array' => ["IZ6WU8KUALYD", "ILSFJVYFGCPZ", "ZDOZUZZIU7FT"]],
                ['ads_space_id' => 4, 'short_code_key_array' => ["Q9YDUIC9HSWS", "IZ6WU8KUALYE"]]

            ];

            date_default_timezone_set(config('app.second_timezone'));
            $today_date = date("Y-m-d H:i:s");
            $ads_table_name = (new VendorPaidAds())->getTable();


            /** Ads for Homepage middle  */
            foreach ($define_ads_short_key_with_space as $key_with_space) {
                if (in_array($attributes_key_first, $key_with_space['short_code_key_array'])) {
                    $vendor_ads_array = [];
                    $query = "SELECT * FROM " . $ads_table_name . " WHERE '" . $today_date . "' BETWEEN start_date AND end_date AND status='published' AND ads_space_id=" . $key_with_space['ads_space_id'];
                    $homepage_middle_ads = DB::select($query);
                    for ($i = 0; $i < count($homepage_middle_ads); $i++) {
                        $ads_info_arr = array('name' => $homepage_middle_ads[$i]->name, 'image' => $homepage_middle_ads[$i]->banner_image, 'link' => $homepage_middle_ads[$i]->link);
                        $vendor_ads_array[] = AdsManager::display_vendor_ads($ads_info_arr);
                    }
                    $default_admin_ads = [];
                    for ($p = 0; $p < count($key_with_space['short_code_key_array']) - count($vendor_ads_array); $p++) {
                        $ad = AdsManager::displayAds($key_with_space['short_code_key_array'][$p]);
                        if ($ad) {
                            $default_admin_ads[] = $ad;
                        }
                    }
                    $ads_array_merge = array_merge($vendor_ads_array, $default_admin_ads);
                    $ads = array_filter($ads_array_merge);
                }
            }
            /**Custom  Ads Logic END */


            /**
             * Default ads Theme  Login Change By Arbaz  --Start
             */
            // for ($i = 1; $i < 5; $i++) {
            //     if (isset($attributes['key_' . $i]) && !empty($attributes['key_' . $i])) {
            //         $ad = AdsManager::displayAds((string)$attributes['key_' . $i]);
            //         if ($ad) {
            //             $ads[] = $ad;
            //         }
            //     }
            // }

            // $ads = array_filter($ads);
            /**
             * Default ads Theme  Login Change By Arbaz  --END
             */

            return Theme::partial('short-codes.theme-ads', compact('ads'));
        });

        shortcode()->setAdminConfig('theme-ads', function ($attributes) {
            $ads = app(AdsInterface::class)->getModel()
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->notExpired()
                ->get();

            return Theme::partial('short-codes.theme-ads-admin-config', compact('ads', 'attributes'));
        });
    }

    add_shortcode('coming-soon', __('Coming soon'), __('Coming soon'), function ($shortCode) {
        return Theme::partial('short-codes.coming-soon', [
            'time'  => $shortCode->time,
            'image' => $shortCode->image,
        ]);
    });

    shortcode()->setAdminConfig('coming-soon', function ($attributes) {
        return Theme::partial('short-codes.coming-soon-admin-config', compact('attributes'));
    });
});
