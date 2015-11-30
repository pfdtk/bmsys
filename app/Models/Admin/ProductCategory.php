<?php namespace App\Models\Admin;

use App\Models\Admin\Base;

/**
 * 店铺核心分类模型
 *
 * @author jiang
 */
class ProductCategory extends Base
{
    /**
     * 表名
     * 
     * @var string
     */
    protected $table = 'product_category';

    /**
     * 定义主键是哪一个
     * 
     * @var string
     */
    protected $primaryKey = 'category_id';

    /**
     * 定义可以集体赋值的字段
     * 
     * @var array
     */
    protected $fillable = array(
        'category_id', 'category_name', 'category_pid', 'category_sort', 
        'add_time', 'update_time', 'category_status',
    );

    /**
     * 是否启用
     *
     * @var int
     */
    CONST CATEGORY_STATUS_YES = 1;
    
    /**
     * 取得所有的数据
     * 
     * @return array
     */
    public function getAllForList($data = [])
    {
        $query = $this->select(['category_id as id', 'category_pid as pid', 'category_pid as parent', 'category_sort', 'add_time', 'update_time', 'category_status', 'category_name'])
                      ->orderBy('category_sort', 'desc')->orderBy('category_id', 'asc');
        return $query->get()->toArray();
    }

    /**
     * 取得所有的数据
     * 
     * @return array
     */
    public function getAllForDropDownTag()
    {
        return $this->select(['category_name as name', 'category_id as id', 'category_pid as pid'])
                ->orderBy('category_sort', 'desc')
                ->orderBy('category_id', 'asc')
                ->get()
                ->toArray();
    }

    /**
     * 增加分类
     * 
     * @param array $data 所需要插入的信息
     */
    public function addShopCategory(array $data)
    {
        return $this->create($data);
    }

    /**
     * 修改分类
     * 
     * @param array $data 所需要插入的信息
     */
    public function editShopCategory(array $data, $id)
    {
        return $this->where('category_id', '=', intval($id))->update($data);
    }
    
    /**
     * 删除分类
     * 
     * @param array $id 权限功能的ID
     */
    public function deleteShopCategory(array $ids)
    {
        return $this->destroy($ids);
    }

    /**
     * 取得指定ID分类
     * 
     * @param intval $id 分类的ID
     * @return array
     */
    public function getShopCategoryById($id)
    {
        return $this->where('category_id', '=', intval($id))->first();
    }
    
    /**
     * 对指定ID的分类进行排序
     * 
     * @param int $id 分类的ID
     * @param int $sort 排序值
     * @return boolean
     */
    public function sortShopCategory($id, $sort)
    {
        return $this->where('category_id', '=', intval($id))->update(array('category_sort' => intval($sort)));
    }
    
    /**
     * 检测记录是否已经存在，用于增加来修该分类的时候的检测
     * 
     * @param array $name 分类名
     * @return boolean
     */
    public function checkIfIsExists($name, $checkSelf = true, $selfId = false)
    {
        $query =  $this->where('category_name', '=', $name);
        if( ! $checkSelf) $query->where('category_id', '!=', intval($selfId));
        return $query->first();
    }

    /**
     * 查找指定ID的子项目
     * 
     * @return array
     */
    public function getSon($ids)
    {
        return $this->whereIn('category_pid', $ids)->get()->toArray();
    }
    
}
