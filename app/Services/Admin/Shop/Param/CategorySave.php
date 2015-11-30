<?php namespace App\Services\Admin\Shop\Param;

use App\Services\AbstractParam;

/**
 * 增加和修改店铺分类参数容器
 *
 * @author jiang <mylampblog@163.com>
 */
class CategorySave extends AbstractParam
{
    protected $category_name;

    protected $category_pid;

    protected $category_sort;

    protected $add_time;

    protected $update_time;

    protected $category_status;

    protected $category_id;

}
