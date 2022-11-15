<?php

if (!function_exists('shortcode')) {
    /**
     * @return \Botble\Shortcode\Shortcode
     */
    function shortcode()
    {
        return app('shortcode');
    }
}

if (!function_exists('add_shortcode')) {
    /**
     * @param string $key
     * @param string|null $name
     * @param null|string $description
     * @param null $callback
     * @return \Botble\Shortcode\Shortcode
     */
    function add_shortcode(string $key, ?string $name, ?string $description = null, $callback = null)
    {
        return shortcode()->register($key, $name, $description, $callback);
    }
}

if (!function_exists('do_shortcode')) {
    /**
     * @param string $content
     * @return string
     */
    function do_shortcode(string $content)
    {
        return shortcode()->compile($content);
    }
}

if (!function_exists('generate_shortcode')) {
    /**
     * @param string $name
     * @param array $attributes
     * @return string
     */
    function generate_shortcode(string $name, array $attributes = []): string
    {
        return shortcode()->generateShortcode($name, $attributes);
    }
}
