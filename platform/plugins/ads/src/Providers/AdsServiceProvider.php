<?php

namespace Botble\Ads\Providers;

use AdsManager;
use Botble\Ads\Facades\AdsManagerFacade;
use Botble\Ads\Models\Ads;
use Botble\Ads\Models\AdsManagements;
use Botble\Ads\Models\AdsSpaceManagements;
use Botble\Ads\Models\PaidAdsManagements;
use Botble\Ads\Repositories\Caches\AdsCacheDecorator;
use Botble\Ads\Repositories\Caches\AdsManagementsCacheDecorator;
use Botble\Ads\Repositories\Caches\AdsSpaceManagementsCacheDecorator;
use Botble\Ads\Repositories\Caches\PaidAdsManagementsCacheDecorator;
use Botble\Ads\Repositories\Eloquent\AdsManagementsRepository;
use Botble\Ads\Repositories\Eloquent\AdsRepository;
use Botble\Ads\Repositories\Eloquent\AdsSpaceManagementsRepository;
use Botble\Ads\Repositories\Eloquent\PaidAdsManagementsRepository;
use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;
use Botble\Ads\Repositories\Interfaces\AdsSpaceManagementsInterface;
use Botble\Ads\Repositories\Interfaces\PaidAdsManagementsInterface;
use Botble\Base\Supports\Helper;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Event;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

class AdsServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        $this->app->bind(AdsInterface::class, function () {
            return new AdsCacheDecorator(new AdsRepository(new Ads));
        });

        /**Ads Managements Repository start */
        $this->app->bind(AdsManagementsInterface::class, function () {
            return new AdsManagementsCacheDecorator(new AdsManagementsRepository(new AdsManagements));
        });
        /**Ads Managements Repository End */

        /**Ads Space Managements Repository Start */
        $this->app->bind(AdsSpaceManagementsInterface::class, function () {
            return new AdsSpaceManagementsCacheDecorator(new AdsSpaceManagementsRepository(new AdsSpaceManagements));
        });
        /**Ads Space Managements Repository End */

        /**Paid Ads Managements Repository Start */
        $this->app->bind(PaidAdsManagementsInterface::class, function () {
            return new PaidAdsManagementsCacheDecorator(new PaidAdsManagementsRepository(new PaidAdsManagements));
        });
        /**Paid Ads Managements Repository End */

        Helper::autoload(__DIR__ . '/../../helpers');

        AliasLoader::getInstance()->alias('AdsManager', AdsManagerFacade::class);
    }

    public function boot()
    {
        $this->setNamespace('plugins/ads')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadRoutes(['web'])
            ->loadAndPublishViews();

        Event::listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id'          => 'cms-plugins-ads',
                    'priority'    => 5,
                    'parent_id'   => null,
                    'name'        => 'plugins/ads::ads.name',
                    'icon'        => 'fas fa-bullhorn',
                    'url'         => route('ads.index'),
                    'permissions' => ['ads.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-ads-managements',
                    'priority'    => 0,
                    'parent_id'   => 'cms-plugins-ads',
                    'name'        => 'plugins/ads::ads.name',
                    'icon'        => null,
                    'url'         => route('ads.index'),
                    'permissions' => ['ads.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-ads-space-managements',
                    'priority'    => 1,
                    'parent_id'   => 'cms-plugins-ads',
                    'name'        => 'plugins/ads::ads.a_s_m_name',
                    'icon'        => null,
                    'url'         => route('ads_space_managements.index'),
                    'permissions' => ['ads_space_managements.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-paid-ads-managements',
                    'priority'    => 2,
                    'parent_id'   => 'cms-plugins-ads',
                    'name'        => 'plugins/ads::ads.p_a_m_name',
                    'icon'        => null,
                    'url'         => route('paid_ads_managements.index'),
                    'permissions' => ['paid_ads_managements.index'],
                ]);
        });

        if (function_exists('shortcode')) {
            add_shortcode('ads', 'Ads', 'Ads', function ($shortcode) {
                if (!$shortcode->key) {
                    return null;
                }

                return AdsManager::displayAds((string)$shortcode->key);
            });
        }

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Ads::class, [
                'name',
                'image',
                'url',
            ]);
        }

        add_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, function ($request, $data = null) {

            if (!$data instanceof Ads || !in_array(Route::currentRouteName(), ['ads.create', 'ads.edit'])) {
                return false;
            }

            echo view('plugins/ads::partials.notification')
                ->render();

            return true;
        }, 45, 2);
    }
}
