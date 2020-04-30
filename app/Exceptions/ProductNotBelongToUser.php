<?php

namespace App\Exceptions;

use Exception;
use Symfony\Component\HttpFoundation\Response;

class ProductNotBelongToUser extends Exception
{
    //
    Public function render(){
        return response([
            'errors'=>'Product not Belongs to User'
        ],Response::HTTP_METHOD_NOT_ALLOWED);
    }
}