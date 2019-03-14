<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $table ="new";
    public function new(){
        return $this->hasMany('App\News','id','title','content');
}
