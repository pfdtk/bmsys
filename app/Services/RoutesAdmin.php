<?php

use App\Services\Admin\SC;
use App\Models\Admin\Permission as PermissionModel;

Route::group(['middleware' => ['csrf']], function() {
    Route::get('/', 'Admin\Foundation\LoginController@index');
    Route::controller('login', 'Admin\Foundation\LoginController', ['getOut' => 'foundation.login.out']);
});

$permisions = (array) Cache::store('file')->get(SC::ALL_PERMISSION_KEY);

if(empty($permisions)) {
    $permisions = (new PermissionModel())->getAllAccessPermission();
}

Route::group(['middleware' => ['auth', 'acl', 'alog']], function() use ($permisions) {
    foreach($permisions as $key => $value) {
        $routeUri = "/".strtolower($value['module'])."/".strtolower($value['class'])."/".strtolower($value['action']).".html";
        $routeAs = strtolower($value['module']).".".strtolower($value['class']).".".strtolower($value['action']);
        $routeUses = "Admin\\".ucfirst(strtolower($value['module']))."\\".ucfirst(strtolower($value['class']))."Controller@".$value['action'];
        Route::any($routeUri, [
            'as' => $routeAs, 'uses' => $routeUses
        ]);
    }
});

