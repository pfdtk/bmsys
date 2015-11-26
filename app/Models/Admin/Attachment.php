<?php namespace App\Models\Admin;

use App\Models\Admin\Base;

/**
 * 上传附件模型
 *
 * @author jiang
 */
class Attachment extends Base
{
    /**
     * 数据表名
     *
     * @var string
     */
    protected $table = 'attachment';

    /**
     * 可以被集体附值的表的字段
     *
     * @var string
     */
    protected $fillable = array(
        'aid', 'filename', 'filepath', 'filesize',
        'fileext', 'isimage', 'isthumb', 'downloads',
        'uploadtime', 'status', 'authcode'
    );
    
    /**
     * is image yes
     *
     * @var const
     */
    CONST IS_IMAGE_YES = 1;

    /**
     * is image no
     *
     * @var const
     */
    CONST IS_IMAGE_NO = 0;

    /**
     * is thumb yes
     *
     * @var const
     */
    CONST IS_THUMB_YES = 1;

    /**
     * is thumb no
     *
     * @var const
     */
    CONST IS_THUMB_NO = 0;

    /**
     * status yes
     *
     * @var const
     */
    CONST STATUS_YES = 1;

    /**
     * status no
     *
     * @var const
     */
    CONST STATUS_NO = 0;

    /**
     * 取得数据
     *
     * @return array
     */
    public function getAllByPage($data)
    {
        $currentQuery = $this->orderBy('aid', 'desc')->where('status', self::STATUS_YES);
        if(isset($data['keyword']) and ! empty($data['keyword'])) $currentQuery->where('filename', 'like','%'.$data['keyword'].'%');
        if(isset($data['time']) and ! empty($data['time']))
        {
            $timeFrom = strtotime(date('Y-m-d', strtotime($data['time'])));
            $timeTo = strtotime(date('Y-m-d', strtotime($data['time']))) + 24 * 3600;
            $currentQuery->whereBetween('uploadtime', [$timeFrom, $timeTo]);
        }
        $result = $currentQuery->paginate(20);
        return $result;
    }

    /**
     * add file
     *
     * @param array $data
     * @return true|false
     */
    public function addFile(array $data)
    {
        if(empty($data)) return true;
        return $this->insert($data);
    }


}
