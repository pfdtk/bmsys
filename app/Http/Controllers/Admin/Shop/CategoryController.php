<?php namespace App\Http\Controllers\Admin\Shop;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\ProductCategory;
use App\Services\Admin\Shop\ProductCategoryProcess;
use App\Services\Admin\Shop\Param\CategorySave;
use App\Services\Admin\Tree;
use App\Libraries\Js;
use Request, Lang, Session;

/**
 * 店铺分类配置
 *
 * @author jiang <mylampblog@163.com>
 */
class CategoryController extends Controller
{
    /**
     * 分类列表
     */
    public function index(ProductCategory $pcModel)
    {
    	Session::flashInput(['http_referer' => Request::fullUrl()]);
        $categoryPid = Request::input('category_pid', 'all');
        $list = $pcModel->getAllForList();
        $list = Tree::genTree($list);

        return view('admin.shopcategory.index',
        	compact('list', 'categoryPid')
        );
    }

    /**
     * 增加分类
     *
     * @access public
     */
    public function add(ProductCategory $pcModel)
    {
        if(Request::method() == 'POST') return $this->addShopCategory();

        $formUrl = route('shop.category.add');
        $select = Tree::dropDownSelect(Tree::genTree($pcModel->getAllForDropDownTag()));

        return view('admin.shopcategory.add',
        	compact('select', 'formUrl')
        );
    }

    /**
     * 增加分类入库处理
     *
     * @access private
     */
    private function addShopCategory()
    {
        $params = new CategorySave();
        $manager = new ProductCategoryProcess();

        $data = (array) Request::input('data');
        $data['add_time'] = $data['update_time'] = time();
        $params->setAttributes($data);

        if($manager->addShopCategory($params) !== false) {
            return Js::locate(route('shop.category.index'), 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }

    /**
     * 分类排序
     */
    public function sort(ProductCategory $pcModel)
    {
    	$sort = (array) Request::input('sort');
        foreach($sort as $key => $value) {
            if($pcModel->sortShopCategory($key, $value) === false) $err = true;
        }
        if(isset($err)) {
            return Js::error(Lang::get('common.action_error'));
        }
        return Js::locate(
            route('shop.category.index'),
            'parent'
        );
    }

    /**
     * 编辑分类
     *
     * @access public
     */
    public function edit(ProductCategory $pcModel)
    {
        if(Request::method() == 'POST') return $this->editShopCategory();
        
        Session::flashInput(['http_referer' => Session::getOldInput('http_referer')]);
        $id = Request::input('id');

        if( ! $id or ! is_numeric($id)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $info = $pcModel->getShopCategoryById(intval($id));

        if(empty($info)) {
            return Js::error(Lang::get('shopcategory.not_found'), true);
        }

        $formUrl = route('shop.category.edit');
        $select = Tree::dropDownSelect(Tree::genTree($pcModel->getAllForDropDownTag()), $info['category_pid']);

        return view('admin.shopcategory.add', compact(
            'select', 'info', 'formUrl', 'id'
        ));
    }
    
    /**
     * 编辑入库
     *
     * @access private
     */
    private function editShopCategory()
    {
        $params = new CategorySave();
        $manager = new ProductCategoryProcess();

        $httpReferer = Session::getOldInput('http_referer');
        $data = (array) Request::input('data');
        $data['update_time'] = time();
        $params->setAttributes($data);
        
        if($manager->editShopCategory($params) !== false) {
            $backUrl = ( ! empty($httpReferer)) ? $httpReferer : route('shop.category.index'); 
            return Js::locate($backUrl, 'parent');
        }

        return Js::error(
        	$manager->getErrorMessage()
        );
    }

    /**
     * 删除分类
     *
     * @access public
     */
    public function delete(ProductCategoryProcess $manager)
    {
        $shopCid = (array) Request::input('id');

        if($manager->detele($shopCid) !== false) {
            return responseJson(Lang::get('common.action_success'), true);
        }

        return responseJson($manager->getErrorMessage());
    }

}