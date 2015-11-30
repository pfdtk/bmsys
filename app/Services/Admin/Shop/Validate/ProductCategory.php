<?php namespace App\Services\Admin\Shop\Validate;

use Validator, Lang;
use App\Services\BaseValidate;
use App\Services\Admin\Shop\Param\CategorySave;

/**
 * 表单验证
 *
 * @author jiang <mylampblog@163.com>
 */
class ProductCategory extends BaseValidate
{
    /**
     * 增加分类的时候的表单验证
     *
     * @access public
     */
    public function add(CategorySave $data)
    {
        $rules = array(
            'category_name'    => 'required',
            'category_pid'  => 'required|numeric',
            'category_sort'   => 'required|numeric',
        );
        
        $messages = array(
            'category_name.required'   => Lang::get('shopcategory.category_name_empty'),

            'category_pid.required'  => Lang::get('shopcategory.category_pid_empty'),
            'category_pid.numeric'  => Lang::get('common.illegal_operation'),

            'category_sort.required'  => Lang::get('shopcategory.category_sort_empty'),
            'category_sort.numeric'  => Lang::get('common.category_sort_numeric'),
        );
        
        $validator = Validator::make($data->toArray(), $rules, $messages);

        if($validator->fails()) {
            $this->errorMsg = $validator->messages()->first();
            return false;
        }
        
        return true;
    }
    
    /**
     * 编辑分类的时候的表单验证
     *
     * @access public
     */
    public function edit(CategorySave $data)
    {
        return $this->add($data);
    }
    
}
