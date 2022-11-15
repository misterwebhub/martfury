<?php

namespace Botble\Ecommerce\Supports;

use Botble\Base\Supports\SortItemsWithChildrenHelper;
use Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use Illuminate\Support\Collection;

class ProductCategoryHelper
{
    /**
     * @var Collection
     */
    protected $allCategories = [];

    /**
     * @return Collection
     */
    public function getAllProductCategories(): Collection
    {
        if (!$this->allCategories instanceof Collection) {
            $this->allCategories = collect([]);
        }

        if ($this->allCategories->count() == 0) {
            $this->allCategories = app(ProductCategoryInterface::class)->getProductCategories();
        }

        return $this->allCategories;
    }

    /**
     * @return Collection
     */
    public function getAllProductCategoriesSortByChildren(): Collection
    {
        $categories = $this->getAllProductCategories();

        return $this->sortChildren($categories);
    }

    /**
     * @return array
     */
    public function getAllProductCategoriesWithChildren(): array
    {
        $categories = $this->getAllProductCategories();

        return app(SortItemsWithChildrenHelper::class)
            ->setChildrenProperty('child_cats')
            ->setItems($categories)
            ->sort();
    }

    /**
     * @param Collection $categories
     * @param null $parent
     * @param int $depth
     * @return Collection
     */
    protected function sortChildren(Collection $categories, $parent = null, int $depth = 0): Collection
    {
        foreach ($categories as &$object) {
            if ($object->parent_id == $object->id) {
                continue;
            }

            if ((int)$object->parent_id == (int)$parent) {
                $object->depth = $depth;
                $this->sortChildren($categories, $object->id, $depth + 1);
            }
        }

        return $categories;
    }

    /**
     * @param string $indent
     * @param bool $sortChildren
     * @return Collection
     */
    public function getProductCategoriesWithIndent(string $indent = '&nbsp;&nbsp;', bool $sortChildren = true): Collection
    {
        $categories = $this->getAllProductCategories();

        foreach ($categories as $category) {
            $depth = (int)$category->depth;

            $indentText = str_repeat($indent, $depth);

            $category->indent_text = $indentText;
        }

        if (!$sortChildren) {
            return $categories;
        }

        return collect(sort_item_with_children($categories));
    }

    /**
     * @param Collection|array $categories
     * @param string $indent
     * @return array
     */
    public function getProductCategoriesWithIndentName($categories = [], string $indent = '&nbsp;&nbsp;'): array
    {
        if (!$categories instanceof Collection) {
            $categories = $this->getAllProductCategories()->whereIn('parent_id', [0, null]);
        }
        $results = [];
        $this->appendIndentTextToProductCategoryName($categories, 0, $results, $indent);

        return $results;
    }

    /**
     * @param Collection $categories
     * @param int $depth
     * @param array $results
     * @param string $indent
     * @return bool
     */
    public function appendIndentTextToProductCategoryName(
        Collection $categories,
        int $depth = 0,
        &$results = [],
        string $indent = '&nbsp;&nbsp;'
    ) {
        foreach ($categories as $category) {
            $results[$category->id] = str_repeat($indent, $depth) . $category->name;
            if ($category->children->count()) {
                $this->appendIndentTextToProductCategoryName($category->children, $depth + 1, $results, $indent);
            }
        }

        return true;
    }
}
