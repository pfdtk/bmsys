<?php namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\Admin\Controller;
use App\Libraries\Js;
use Request, Lang;

/**
 * 产品列表
 *
 * @author jiang <mylampblog@163.com>
 */
class IndexController extends Controller
{
    /**
     * 产品列表
     */
    public function index()
    {
        return view('admin.product.index');
    }

}