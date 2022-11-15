<?php

namespace Botble\SimpleSlider\Providers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Marketplace\Models\VendorPaidAds;
use Botble\Shortcode\Compilers\Shortcode;
use Botble\SimpleSlider\Repositories\Interfaces\SimpleSliderInterface;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use Theme;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (function_exists('shortcode')) {
            add_shortcode(
                'simple-slider',
                trans('plugins/simple-slider::simple-slider.simple_slider_shortcode_name'),
                trans('plugins/simple-slider::simple-slider.simple_slider_shortcode_description'),
                [$this, 'render']
            );

            shortcode()->setAdminConfig('simple-slider', function ($attributes) {
                $sliders = $this->app->make(SimpleSliderInterface::class)
                    ->pluck('name', 'key', ['status' => BaseStatusEnum::PUBLISHED]);

                return view('plugins/simple-slider::partials.simple-slider-admin-config', compact('sliders', 'attributes'))
                    ->render();
            });
        }

        add_filter(BASE_FILTER_AFTER_SETTING_CONTENT, [$this, 'addSettings'], 301);
    }

    /**
     * @param Shortcode $shortcode
     * @return null
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    public function render($shortcode)
    {
        $slider = $this->app->make(SimpleSliderInterface::class)->getFirstBy([
            'key'    => $shortcode->key,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        $slider_item = array();
        date_default_timezone_set(config('app.second_timezone'));
        $today_date = date("Y-m-d H:i:s");
        $ads_table_name = (new VendorPaidAds())->getTable();

        /**Get Paid Ads Image 
         * @ ads_space_id=1 for header space
         */
        $query = "SELECT * FROM " . $ads_table_name . " WHERE '" . $today_date . "' BETWEEN start_date AND end_date  AND ads_space_id=1 AND status='published'";
        $vendor_paid_ads = DB::select($query);
        for ($i = 0; $i < count($vendor_paid_ads); $i++) {
            $slider_item[] = array('image' => $vendor_paid_ads[$i]->banner_image, 'link' => $vendor_paid_ads[$i]->link);
        }
        /**Get Paid Ads Image END */


        /**From Simple Slider Plugin */
        $simple_slider = $slider->sliderItems;
        foreach ($simple_slider as $slider) {
            $slider_item[] = array('image' => $slider->image, 'link' => $slider->link);
        }
        /**From Simple Slider Plugin END */


        if (empty($slider_item)) {
            return null;
        }

        /**
         * TOP BANNER SIDEBAR ADS SPACE
         * @ ads_space_id=2 for TOP SLIDER SIDEBAR ads space
         */
        $sidebar_ads_array = [];
        $side_bar_query = "SELECT * FROM " . $ads_table_name . " WHERE '" . $today_date . "' BETWEEN start_date AND end_date  AND ads_space_id=2 AND status='published'";
        $sidebar_ads_manage = DB::select($side_bar_query);
        for ($i = 0; $i < count($sidebar_ads_manage); $i++) {
            $sidebar_ads_array[] = array('name' => $sidebar_ads_manage[$i]->name, 'image' => $sidebar_ads_manage[$i]->banner_image, 'link' => $sidebar_ads_manage[$i]->link);
        }
        /**
         * TOP BANNER SIDEBAR ADS END
         */

        if (setting('simple_slider_using_assets', true) && defined('THEME_OPTIONS_MODULE_SCREEN_NAME')) {
            $version = '1.0.1';
            $dist = asset('vendor/core/plugins/simple-slider');

            Theme::asset()
                ->container('footer')
                ->usePath(false)
                ->add('simple-slider-owl-carousel-css', $dist . '/libraries/owl-carousel/owl.carousel.css', [], [], $version)
                ->add('simple-slider-css', $dist . '/css/simple-slider.css', [], [], $version)
                ->add('simple-slider-owl-carousel-js', $dist . '/libraries/owl-carousel/owl.carousel.js', ['jquery'], [], $version)
                ->add('simple-slider-js', $dist . '/js/simple-slider.js', ['jquery'], [], $version);
        }

        return view(apply_filters(SIMPLE_SLIDER_VIEW_TEMPLATE, 'plugins/simple-slider::sliders'), [
            'sliders'   => $slider_item,
            'shortcode' => $shortcode,
            'slider'    => $slider,
            'sidebar_ads_array' => $sidebar_ads_array
        ]);
    }

    /**
     * @param null $data
     * @return string
     * @throws \Throwable
     */
    public function addSettings($data = null)
    {
        return $data . view('plugins/simple-slider::setting')->render();
    }
}
