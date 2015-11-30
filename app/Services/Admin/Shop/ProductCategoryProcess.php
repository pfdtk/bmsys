<?php namespace App\Services\Admin\Shop;

use Lang;
use App\Services\BaseProcess;
use App\Models\Admin\ProductCategory as ProductCategoryModel;
use App\Services\Admin\Shop\Validate\ProductCategory as ProductCategoryValidate;
use App\Services\Admin\Shop\Param\CategorySave;

/**
 * 店铺核心分类处理
 *
 * @author jiang <mylampblog@163.com>
 */
class ProductCategoryProcess extends BaseProcess
{
    /**
     * 模型
     * 
     * @var object
     */
    private $productCategoryModel;

    /**
     * 表单验证对象
     * 
     * @var object
     */
    private $productCategoryValidate;

    /**
     * 初始化
     *
     * @access public
     */
    public function __construct()
    {
        if( ! $this->productCategoryModel) $this->productCategoryModel = new ProductCategoryModel();
        if( ! $this->productCategoryValidate) $this->productCategoryValidate = new ProductCategoryValidate();
    }

    /**
     * 增加新的权限菜单
     *
     * @param object $data
     * @return boolean true|false
     * @access public
     */
    public function addShopCategory(CategorySave $data)
    {
        if( ! $this->productCategoryValidate->add($data)) {
            return $this->setErrorMsg($this->productCategoryValidate->getErrorMessage());
        }

        if($this->productCategoryModel->checkIfIsExists($data->category_name)) {
            return $this->setErrorMsg(Lang::get('shopcategory.name_exists'));
        }

        $data = $data->toArray();

        if($this->productCategoryModel->addShopCategory($data) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

    /**
     * 删除店铺分类
     * 
     * @param array $shopCid
     * @return boolean true|false
     * @access public
     */
    public function detele(array $shopCid)
    {
        if($this->productCategoryModel->getSon($shopCid)) {
            return $this->setErrorMsg(Lang::get('shopcategory.has_son'));
        }

        if($this->productCategoryModel->deleteShopCategory($shopCid) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

    /**
     * 编辑店铺分类
     *
     * @param object $data
     * @return boolean true|false
     * @access public
     */
    public function editShopCategory(CategorySave $data)
    {
        $id = intval($data->category_id); unset($data->category_id);

        if( ! $this->productCategoryValidate->edit($data)) {
            return $this->setErrorMsg($this->productCategoryValidate->getErrorMessage());
        }

        if($this->productCategoryModel->checkIfIsExists($data->category_name, false, $id)) {
            return $this->setErrorMsg(Lang::get('shopcategory.name_exists'));
        }

        $data = $data->toArray();

        if($this->productCategoryModel->editShopCategory($data, $id) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }


}