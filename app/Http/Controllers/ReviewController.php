<?php

namespace App\Http\Controllers;

use App\Exceptions\ProductNotBelongToUser;
use App\Http\Requests\ReviewRequest;
use App\Http\Resources\ReviewResource;
use App\Product;
use App\Review;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Product $product)
    {
        //
        return ReviewResource::collection($product->reviews);
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ReviewRequest $request,Product $product)
    {
        //
        $review = new Review($request->all());
        $product->reviews()->save($review);

        return response([
            'data' => new ReviewResource($review)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function update(ReviewRequest $request,Product $product, Review $review)
    {
        //
        $prod=$product->reviews()->get()->toArray();
        foreach($prod as $key => $p){
            if($p['id'] == $review->id){
                $foundIt[] = "match";
            }
        }
        if(isset($foundIt)){
            $review->update($request->all());
            return response(null,Response::HTTP_OK);
        }else{
            throw new ProductNotBelongToUser;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product,Review $review)
    {
        //
        $prod=$product->reviews()->get()->toArray();
        foreach($prod as $key => $p){
            if($p['id'] == $review->id){
                $foundIt[] = "match";
            }
        }
        if(isset($foundIt)){
            $review->delete();
            return response(null,Response::HTTP_NO_CONTENT);
        }else{
            throw new ProductNotBelongToUser;
        }
    }

}
