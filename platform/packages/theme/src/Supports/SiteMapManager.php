<?php

namespace Botble\Theme\Supports;

use AdminBar;
use BaseHelper;
use Illuminate\Contracts\Container\BindingResolutionException;
use Botble\Sitemap\Sitemap;
use Illuminate\Http\Response;

class SiteMapManager
{
    /**
     * @var Sitemap
     */
    protected $siteMap;

    /**
     * SiteMapManager constructor.
     * @throws BindingResolutionException
     */
    public function __construct()
    {
        // create new site map object
        $this->siteMap = app()->make('sitemap');

        // set cache (key (string), duration in minutes (Carbon|Datetime|int), turn on/off (boolean))
        // by default cache is disabled
        $this->siteMap->setCache('public.sitemap', config('core.base.general.cache_site_map'));

        if (!BaseHelper::getHomepageId()) {
            $this->siteMap->add(route('public.index'), '2022-05-05 10:00', '1.0', 'daily');
        }

        AdminBar::setIsDisplay(false);
    }

    /**
     * @param string $url
     * @param string $date
     * @param string $priority
     * @param string $sequence
     * @return $this
     */
    public function add(string $url, string $date, string $priority = '1.0', string $sequence = 'daily'): self
    {
        if (!$this->siteMap->isCached()) {
            $this->siteMap->add($url, $date, $priority, $sequence);
        }

        return $this;
    }

    /**
     * @param string $type
     * @return Response
     */
    public function render(string $type = 'xml'): Response
    {
        // show your site map (options: 'xml' (default), 'html', 'txt', 'ror-rss', 'ror-rdf')
        return $this->siteMap->render($type);
    }
}
