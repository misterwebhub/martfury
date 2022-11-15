<?php

namespace Botble\CustomModule\Providers;

use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\CustomModule\Models\Post;
use Botble\CustomModule\Repositories\Caches\PostCacheDecorator;
use Botble\CustomModule\Repositories\Eloquent\PostRepository;
use Botble\CustomModule\Repositories\Interfaces\PostInterface;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;
use Botble\CustomModule\Models\Category;
use Botble\CustomModule\Repositories\Caches\CategoryCacheDecorator;
use Botble\CustomModule\Repositories\Eloquent\CategoryRepository;
use Botble\CustomModule\Repositories\Interfaces\CategoryInterface;
use Botble\CustomModule\Models\Tag;
use Botble\CustomModule\Repositories\Caches\TagCacheDecorator;
use Botble\CustomModule\Repositories\Eloquent\TagRepository;
use Botble\CustomModule\Repositories\Interfaces\TagInterface;
use Language;
use Note;
use SeoHelper;
use SlugHelper;

/**
 * @since 02/07/2016 09:50 AM
 */
class BlogServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        $this->app->bind(PostInterface::class, function () {
            return new PostCacheDecorator(new PostRepository(new Post()));
        });

        $this->app->bind(CategoryInterface::class, function () {
            return new CategoryCacheDecorator(new CategoryRepository(new Category()));
        });

        $this->app->bind(TagInterface::class, function () {
            return new TagCacheDecorator(new TagRepository(new Tag()));
        });
    }

    public function boot()
    {
        SlugHelper::registerModule(Post::class, 'CustomModule Posts');
        SlugHelper::registerModule(Category::class, 'CustomModule Categories');
        SlugHelper::registerModule(Tag::class, 'CustomModule Tags');

        SlugHelper::setPrefix(Tag::class, 'tag', true);
        SlugHelper::setPrefix(Post::class, null, true);
        SlugHelper::setPrefix(Category::class, null, true);

        $this->setNamespace('plugins/CustomModule')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes(['web', 'api'])
            ->loadMigrations()
            ->publishAssets();

        $this->app->register(EventServiceProvider::class);

        Event::listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id'          => 'cms-plugins-CustomModule',
                    'priority'    => 3,
                    'parent_id'   => null,
                    'name'        => 'plugins/CustomModule::base.menu_name',
                    'icon'        => 'fa fa-edit',
                    'url'         => route('posts.index'),
                    'permissions' => ['posts.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-CustomModule-post',
                    'priority'    => 1,
                    'parent_id'   => 'cms-plugins-CustomModule',
                    'name'        => 'plugins/CustomModule::posts.menu_name',
                    'icon'        => null,
                    'url'         => route('posts.index'),
                    'permissions' => ['posts.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-CustomModule-categories',
                    'priority'    => 2,
                    'parent_id'   => 'cms-plugins-CustomModule',
                    'name'        => 'plugins/CustomModule::categories.menu_name',
                    'icon'        => null,
                    'url'         => route('categories.index'),
                    'permissions' => ['categories.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-CustomModule-tags',
                    'priority'    => 3,
                    'parent_id'   => 'cms-plugins-CustomModule',
                    'name'        => 'plugins/CustomModule::tags.menu_name',
                    'icon'        => null,
                    'url'         => route('tags.index'),
                    'permissions' => ['tags.index'],
                ]);
        });

        $useLanguageV2 = $this->app['config']->get('plugins.CustomModule.general.use_language_v2', false) &&
            defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME');

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && $useLanguageV2) {
            LanguageAdvancedManager::registerModule(Post::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(Category::class, [
                'name',
                'description',
            ]);

            LanguageAdvancedManager::registerModule(Tag::class, [
                'name',
                'description',
            ]);
        }

        $this->app->booted(function () use ($useLanguageV2) {
            $models = [Post::class, Category::class, Tag::class];

            if (defined('LANGUAGE_MODULE_SCREEN_NAME') && !$useLanguageV2) {
                Language::registerModule($models);
            }

            SeoHelper::registerModule($models);

            $configKey = 'packages.revision.general.supported';
            config()->set($configKey, array_merge(config($configKey, []), [Post::class]));

            if (defined('NOTE_FILTER_MODEL_USING_NOTE')) {
                Note::registerModule(Post::class);
            }

            $this->app->register(HookServiceProvider::class);
        });

        if (function_exists('shortcode')) {
            view()->composer([
                'plugins/CustomModule::themes.post',
                'plugins/CustomModule::themes.category',
                'plugins/CustomModule::themes.tag',
            ], function (View $view) {
                $view->withShortcodes();
            });
        }
    }
}
