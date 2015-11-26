<?php

/**
 * 暂时用的
 *
 * @author jiang
 */

namespace App\Services;

class Tmp
{
    static public $tmp;

    static public function setTmp()
    {
    	if( ! self::$tmp) {
    		self::$tmp = true;
    	}
    }

    static public function getTmp()
    {
    	return self::$tmp;
    }
    
}
