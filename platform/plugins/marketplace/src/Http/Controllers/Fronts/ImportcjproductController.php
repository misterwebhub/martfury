<?php

namespace Botble\Marketplace\Http\Controllers\Fronts;

use Assets;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Ecommerce\Repositories\Interfaces\OrderInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Marketplace\Enums\RevenueTypeEnum;
use Botble\Marketplace\Enums\WithdrawalStatusEnum;
use Botble\Marketplace\Http\Requests\BecomeVendorRequest;
use Botble\Marketplace\Models\Store;
use Botble\Marketplace\Repositories\Interfaces\RevenueInterface;
use Botble\Marketplace\Repositories\Interfaces\StoreInterface;
use Botble\Marketplace\Repositories\Interfaces\VendorInfoInterface;
use Botble\Marketplace\Repositories\Interfaces\WithdrawalInterface;
use Botble\Media\Chunks\Exceptions\UploadMissingFileException;
use Botble\Media\Chunks\Handler\DropZoneUploadHandler;
use Botble\Media\Chunks\Receiver\FileReceiver;
use EcommerceHelper;
use Exception;
use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\Config\Repository;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use MarketplaceHelper;
use Response;
use GuzzleHttp\Client;
use RvMedia;
use SeoHelper;
use SlugHelper;
use Activity;
use Theme;
use Auth;
use Illuminate\Support\Str;
use Mimey\MimeTypes;
use Illuminate\Http\UploadedFile;


use Excel;

class ImportcjproductController
{
    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var CustomerInterface
     */
    protected $customerRepository;
  

    /**
     * @var StoreInterface
     */
    protected $storeRepository;

    /**
     * @var VendorInfoInterface
     */
    protected $vendorInfoRepository;

    /**
     * @var RevenueInterface
     */
    protected $revenueRepository;

    /**
     * @var OrderInterface
     */
    protected $orderRepository;

    /**
     * @var ProductInterface
     */
    protected $productRepository;

    /**
     * @var WithdrawalInterface
     */
    protected $withdrawalRepository;

    /**
     * DashboardController constructor.
     * @param Repository $config
     * @param CustomerInterface $customerRepository
     * @param StoreInterface $storeRepository
     * @param VendorInfoInterface $vendorInfoRepository
     * @param RevenueInterface $revenueRepository
     * @param ProductInterface $productRepository
     * @param WithdrawalInterface $withdrawalRepository
     * @param OrderInterface $orderRepository
     */
    public function __construct(
        Repository $config,
        CustomerInterface $customerRepository,
        
        StoreInterface $storeRepository,
        VendorInfoInterface $vendorInfoRepository,
        RevenueInterface $revenueRepository,
        ProductInterface $productRepository,
        WithdrawalInterface $withdrawalRepository,
        OrderInterface $orderRepository
    ) {
        $this->storeRepository = $storeRepository;
        $this->customerRepository = $customerRepository;
       
        $this->vendorInfoRepository = $vendorInfoRepository;
        $this->orderRepository = $orderRepository;
        $this->revenueRepository = $revenueRepository;
        $this->productRepository = $productRepository;
        $this->withdrawalRepository = $withdrawalRepository;

        Assets::setConfig($config->get('plugins.marketplace.assets', []));

        Theme::asset()
            ->add('customer-style', 'vendor/core/plugins/ecommerce/css/customer.css');

        Theme::asset()
            ->container('footer')
            ->add('ecommerce-utilities-js', 'vendor/core/plugins/ecommerce/js/utilities.js', ['jquery'])
            ->add('cropper-js', 'vendor/core/plugins/ecommerce/libraries/cropper.js', ['jquery'])
            ->add('avatar-js', 'vendor/core/plugins/ecommerce/js/avatar.js', ['jquery']);
    }

    /**
     * @return BaseHttpResponse|Application|Factory|View
     */
    public function index(Request $request, BaseHttpResponse $response)
    {
        page_title()->setTitle(__('Import Product'));
		
		$category_data = DB::table('ec_product_categories')->where('is_cj','Yes')->get();       
		
        return MarketplaceHelper::view('dashboard.importcj',compact('category_data'));
    }


	public function get_products_from_dropship(Request $request) {
		$store = auth('customer')->user()->store;
		$store_id = $store->id;
       try{


            $client       = new Client;

            $api_url    = 'https://developers.cjdropshipping.com/api2.0/v1/authentication/getAccessToken';


            $category_api_url = 'https://developers.cjdropshipping.com/api2.0/v1/product/getCategory';

            $access_token = $this->get_access_token($api_url,$client,$request);
			
            $result_2 = $client->get($category_api_url, ['headers' => ['CJ-Access-Token' => $access_token]]);

            $categories =  json_decode($result_2->getBody()->getContents());
			
			
		//dd($categories);
            $i = 1;

            if($categories->message == 'Success'){
				
              foreach($categories->data as $cat){
				//dd($cat);
               // if($i == 1){
					
                  //$category = new Category;
                  $records = DB::table('ec_product_categories')->select('*')->where(['name' => $cat->categoryFirstName])->first();
				
                  if($records && !empty($records)){
                    $category_id = $records->id;
					
                  }else{
					$category_data = array(
						'name' => $cat->categoryFirstName,
						'category_cj_id' => $cat->categoryFirstId,
						'is_cj' => 'Yes',
						'parent_id' => 0,
						'status' => 'published',
						'order' => 0,
						//'author_id' => (int)Auth::user()->id,
						'created_at' => date('Y-m-d h:i:s'),
					); 
					
					
                    $category_insert = DB::table('ec_product_categories')->insertGetId($category_data);					
					$category_id = $category_insert;
					
					if($category_id){
						$category_slug_data = array(
								'key' => Str::slug($cat->categoryFirstName, '-'),
								'reference_id' => $category_id,
								'reference_type' => 'Botble\Ecommerce\Models\ProductCategory',
								'prefix' => 'product-categories',								
								'created_at' => date('Y-m-d h:i:s'),
								'updated_at' => date('Y-m-d h:i:s'),
							); 
						$category_slug_insert = DB::table('slugs')->insertGetId($category_slug_data);		
					}
                  }
				
                  foreach($cat->categoryFirstList as $sub){
						
                          //$categories = new Category;
                          //$reco = Category::select('*')->where(['category_name' => $sub->categorySecondName])->first();
						  $reco = DB::table('ec_product_categories')->select('*')->where(['name' => $sub->categorySecondName])->first();
                          if($reco && !empty($reco)){
                            $sub_category_id = $reco->id;
                          }else{

                          /*$categories->category_name = $sub->categorySecondName;
                          $categories->slug = str_slug($sub->categorySecondName);
                          $categories->level = '2';
                          $categories->save();
						  */
						  $sub_category_data = array(
								'name' => $sub->categorySecondName,
								'category_cj_id' => $sub->categorySecondId,
								'is_cj' => 'Yes',
								'parent_id' => $category_id,
								'status' => 'published',
								'order' => 2,
								//'author_id' => (int)Auth::user()->id,
								'created_at' => date('Y-m-d h:i:s'),
							); 
							$sub_category_insert = DB::table('ec_product_categories')->insertGetId($sub_category_data);
							$sub_category_id = $sub_category_insert;
							if($sub_category_id){
								$sub_category_slug_data = array(
										'key' => Str::slug($sub->categorySecondName, '-'),
										'reference_id' => $sub_category_id,
										'reference_type' => 'Botble\Ecommerce\Models\ProductCategory',
										'prefix' => 'product-categories',								
										'created_at' => date('Y-m-d h:i:s'),
										'updated_at' => date('Y-m-d h:i:s'),
									); 
								$sub_category_slug_data_insert = DB::table('slugs')->insertGetId($sub_category_slug_data);		
							}	
                          }


				

                        foreach($sub->categorySecondList as $sub_cat){

                          //$categoriess = new Category;
                          //$recos = Category::select('*')->where(['category_name' => $sub_cat->categoryName])->first();
						   $recos = DB::table('ec_product_categories')->select('*')->where(['name' => $sub_cat->categoryName])->first();
                          if($recos && !empty($recos)){
                            $third_categories_id = $recos->id;
                          }else{

                          /*$categoriess->category_name = $sub_cat->categoryName;
                          $categoriess->slug = str_slug($sub_cat->categoryName);
                          $categoriess->level = '3';
                          $categoriess->save();
						  */
						  $third_category_data = array(
								'name' => $sub_cat->categoryName,
								'category_cj_id' => $sub_cat->categoryId,
								'is_cj' => 'Yes',
								'parent_id' => $sub_category_id,
								'status' => 'published',
								'order' => 3,
								//'author_id' => (int)Auth::user()->id,
								'created_at' => date('Y-m-d h:i:s'),
							); 
							$third_category_insert = DB::table('ec_product_categories')->insertGetId($third_category_data);
							$third_category_id = $third_category_insert;
							if($third_category_id){
								$thirdsub_category_slug_data = array(
										'key' => Str::slug($sub_cat->categoryName, '-'),
										'reference_id' => $third_category_id,
										'reference_type' => 'Botble\Ecommerce\Models\ProductCategory',
										'prefix' => 'product-categories',								
										'created_at' => date('Y-m-d h:i:s'),
										'updated_at' => date('Y-m-d h:i:s'),
									); 
								$thirdsub_category_slug_data = DB::table('slugs')->insertGetId($thirdsub_category_slug_data);		
							}	

                          }


                        }

                  }

               
                
              }
              dd("done");

            }

            else{

              return response()->json(['status' => 0, 'message' => "Something went wrong in get category api", 'data' => '']);

            }

          }catch(\Exception $e){

            return response()->json(['status' => 0, 'message' => $e->getMessage(), 'data' => '']);

          }
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
	 
	public function get_products_from_dropship_category(Request $request, BaseHttpResponse $response){	 
		 
		
		$category= array($request->input('category_ids'));
		
		$pageNum= (int)$request->input('page_number');
		//$pageSize= (int)$request->input('product_number');
		//$pageSize= 10;
		
		//dd($category);
		$store = auth('customer')->user()->store;
		$store_id = $store->id;
		$client       = new Client;
		$api_url    = 'https://developers.cjdropshipping.com/api2.0/v1/authentication/getAccessToken';		
		
        try{
			 
			foreach($category as $key=> $categoryid){				
				$params = '?pageNum='.$pageNum.'&categoryId='.$categoryid;
				//$params = '?categoryId='.$categoryid;				
				$product_api_url = 'https://developers.cjdropshipping.com/api2.0/v1/product/list'.$params;
				$access_token = $this->get_access_token($api_url,$client,$request);
				$result_2 = $client->get($product_api_url, ['headers' => ['CJ-Access-Token' => $access_token]]);
				$products =  json_decode($result_2->getBody()->getContents());
				//dd($category);
			if(!empty($products->data->list)){	
				if($products->message == 'Success'){	 
					foreach($products->data->list as $key => $prod){				  
						if($key <= 4){
						$prod_detail_api_url = 'https://developers.cjdropshipping.com/api2.0/v1/product/query?pid='.$prod->pid;		
						$result_2 = $client->get($prod_detail_api_url, ['headers' => ['CJ-Access-Token' => $access_token]]);							
						$prod_details =  json_decode($result_2->getBody()->getContents());

						//dd($prod_details); 
						$sku = $prod_details->data->productSku;	
						//check old records if exists
						
						$product_image = json_decode($prod_details->data->productImage);
						$sale_price =explode('-',$prod_details->data->sellPrice);
						$productImageSet = $prod_details->data->productImageSet;						
						$productImageSet_array = array();
						if($productImageSet){
							foreach($productImageSet as $keyiamge => $ImageSet){
								$productImageSet_url = $ImageSet;								
								if(empty($productImageSet_url)) {
									return $productImageSet_url;
								}
								$info_imageset = pathinfo($productImageSet_url);
								try {
									$contents = file_get_contents($productImageSet_url);
								} catch (Exception $exception) {
									return $productImageSet_url;
								}
										
								if (empty($contents)) {
									return $productImageSet_url;
								}
								$base_name = explode('_',$info_imageset['basename']);
								foreach($base_name as $base_for_imgset){
									$ext = pathinfo($base_for_imgset, PATHINFO_EXTENSION);
									if(!empty($ext)){
										$base_name_img = $base_for_imgset;
									}	
								}
								//dd($base_name_img);	
								$filename_ImageSet = 'products/'.rand(10,1000).$base_name_img;
								$path_imageset = public_path('storage/').$filename_ImageSet;

								if(file_exists($path_imageset)){
									unlink($path_imageset);
								}
								file_put_contents($path_imageset, $contents);
								$mimeType = $info_imageset['extension'];
								$fileUpload = new UploadedFile($path_imageset, $filename_ImageSet, $mimeType, null, true);
								$result = RvMedia::handleUpload($fileUpload, 0, 'products');
								$productImageSet_array[$keyiamge] = $filename_ImageSet;
							}
						}
						/*$url = $product_image[0];							
						if (empty($url)) {
							return $url;
						}
						$info = pathinfo($url);						
						try {
							$contents = file_get_contents($url);
						} catch (Exception $exception) {
							return $url;
						}						
						if (empty($contents)) {
							return $url;
						}
						$filename = 'products/'.rand(10,1000).$info['basename'];
						$path = public_path('storage/').$filename;						
						if(file_exists($path)){
							unlink($path);
						}		
						file_put_contents($path, $contents);
						$mimeType = $info['extension'];
						$fileUpload = new UploadedFile($path, $filename, $mimeType, null, true);
						$result = RvMedia::handleUpload($fileUpload, 0, 'products');
						$image_array_name = array($filename);
						$total_image_set = array_merge($image_array_name,$productImageSet_array);
						*/
						$product_images = json_encode($productImageSet_array);
						$commision = ($sale_price[0] * 35/100);
						$product_data = array(	
						
										'name' =>$prod_details->data->productNameEn,
										'description' =>'',
										'content' =>$prod_details->data->description,
										'status' =>'published',
										'images' =>$product_images,
										'sku' =>$prod_details->data->productSku,
										'order'=>0,
										'quantity'=>100000,
										'allow_checkout_when_out_of_stock'=>0,
										'with_storehouse_management'=>1,
										'is_featured'=>1,
										'brand_id'=>0,
										'sale_type'=>0,
										'price'=>($sale_price[0] + $commision)	,
										'sale_price'=>($sale_price[0] + $commision),
										'start_date'=>'',
										'end_date'=>'',
										'length'=>'',
										'wide'=>'',
										'height'=>'',
										'is_variation'=>0,
										//'is_cj'=>1,
										//'product_cj_id'=>$prod_details->data->pid,
										'weight'=>$prod_details->data->packingWeight,
										'tax_id'=>1,
										'created_at'=>date('Y-m-d h:s:i'),
										'stock_status'=>'in_stock',
										'store_id'=>$store_id,
											
							);
						
							
						//$product = DB::table('ec_products')->insertGetId($product_data);
						$check_data = DB::table('ec_products')->where('sku' , $sku)->where('store_id',$store_id)->first();
							
						if($check_data){
							$product_insert = DB::table('ec_products')->where('sku', $sku)->where('store_id', $store_id)->update($product_data);	
							$product = $check_data->id;
						}else{
							$product = DB::table('ec_products')->insertGetId($product_data);	
						}
											
						if($product) {
							$category_name = $prod_details->data->categoryId;							
							$recos = DB::table('ec_product_categories')->select('*')->where(['category_cj_id' => $category_name])->first();
							 
							if($recos && !empty($recos)){
								$categoriess = $recos->id;
							  
							}
							$product_category_id = array(
										'category_id' =>$categoriess ,
										'product_id' => $product,
										
										);
							$check_product_category = DB::table('ec_product_category_product')->select('*')->where(['product_id' => $product])->first();
							if($check_product_category){
								$product_categories = DB::table('ec_product_category_product')->where(['product_id' => $product])->update($product_category_id);
							}else{
								$product_categories = DB::table('ec_product_category_product')->insert($product_category_id);
							}					
															
							$ec_products_translations = array(
										'lang_code' =>'vi' ,
										'ec_products_id' => $product,
										'name' => $prod_details->data->productNameEn,										
										);

							$check_prduct_trans =  DB::table('ec_products_translations')->where('ec_products_id',$product)->first();			
							if($check_prduct_trans){
								$ec_products_translations_insert = DB::table('ec_products_translations')->where('ec_products_id',$product)->update($ec_products_translations);
							}else{
								$ec_products_translations_insert = DB::table('ec_products_translations')->insert($ec_products_translations);
							}
							
							if($product){
								$thirdsub_slug_data = array(
											'key' => Str::slug($prod_details->data->productNameEn, '-'),
											'reference_id' => $product,
											'reference_type' => 'Botble\Ecommerce\Models\Product',
											'prefix' => 'products',								
											'created_at' => date('Y-m-d h:i:s'),
											'updated_at' => date('Y-m-d h:i:s'),
								); 
									
								$check_slug = DB::table('slugs')->where('reference_id',$product)->where('prefix','products')->first();
								
								if($check_slug){
									$thirdsub_slug = DB::table('slugs')->where('reference_id',$product)->update($thirdsub_slug_data);
								}else{
									
									$thirdsub_slug = DB::table('slugs')->insertGetId($thirdsub_slug_data);	
									//dd($thirdsub_slug);
								}

										
							}
							// strart test 
							$this->insert_variation_product($product,$prod_details,$store_id);
							
						}	
					
					 	
						}
					}	
					//return $response
					//->setNextUrl('vendor/products')
					//->setMessage(trans('core/base::notices.create_success_message'));
					return 'Products insert successfully';
				}	
				 
			}
			return 'Products are not available in this category';



			}
			// return $response
            //->setNextUrl('vendor/products')
            //->setMessage(trans('core/base::notices.create_success_message'));
			return 'Products insert successfully';
        }catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }

    }
	
	



	public function insert_variation_product($product,$prod_details,$store_id){
		if($prod_details->data->productKeyEn){
			$variants_type = explode('-',$prod_details->data->productKeyEn);
			foreach($variants_type as $Variantkey => $VariantsSet){									
				$variantsets = DB::table('ec_product_attribute_sets')->select('*')->where(['title' => $VariantsSet])->first();											  
				if($variantsets){
					$product_attri_set_data=array(
									'attribute_set_id'=> $variantsets->id,
									'product_id'=>$product,
								);
					$variation_insert_set =	$variantsets->id;		
				}else{
					$variation_insert_set_array = array(
									'title'=> $VariantsSet,
									'slug' => strtolower($VariantsSet),
									'display_layout'=>'text',
									'is_searchable' => 1,
									'is_comparable' =>1,
									'is_use_in_product_listing' => 1,
									'status' => 'published',
									'order' => 2,
									
					);
					
					$variation_insert_set = DB::table('ec_product_attribute_sets')->insertGetId($variation_insert_set_array);
					
					$product_attri_set_data=array(
									'attribute_set_id'=> $variation_insert_set,
									'product_id'=>$product,
								);
				}
				$check_prod_attri = DB::table('ec_product_with_attribute_set')->select('*')->where('attribute_set_id',$variation_insert_set)->where('product_id',$product)->first();
				if($check_prod_attri){
					$product_attri_set_data_insert = DB::table('ec_product_with_attribute_set')->where('attribute_set_id',$variation_insert_set)->where('product_id',$product)->update($product_attri_set_data);
				}else{
					$product_attri_set_data_insert = DB::table('ec_product_with_attribute_set')->insertGetId($product_attri_set_data);
				}
				
			}	
		}
		//Test code by pradeep
		if($prod_details->data->variants){													
			foreach($prod_details->data->variants as $variankeys => $variants){
				//if($variankeys == 0){
					$commision_variation = ($variants->variantSellPrice * 35/100);
					$urls = $variants->variantImage;						
					if (empty($urls)) {
						return $urls;
					}
					$infos = pathinfo($urls);
					try {
						$contents = file_get_contents($urls);
					} catch (Exception $exception) {
						return $urls;
					}
					if (empty($contents)) {
						return $urls;
					}
					$base_name_var = explode('_',$infos['basename']);
					foreach($base_name_var as $base_for_imgsetvar){
						$ext = pathinfo($base_for_imgsetvar, PATHINFO_EXTENSION);
						if(!empty($ext)){
							$base_name_img_var = $base_for_imgsetvar;
						}	
					}
					$filenames = 'products/'.rand(10,1000).$base_name_img_var;
					$path = public_path('storage/').$filenames;												//dd($filename	);
					if(file_exists($path)){
						unlink($path);
					}	
					file_put_contents($path, $contents);
					$mimeType = $infos['extension'];
					$fileUpload = new UploadedFile($path, $filenames, $mimeType, null, true);
					$result = RvMedia::handleUpload($fileUpload, 0, 'products');

					
					$image_array_names = array($filenames);
					$product_image = json_encode($image_array_names);
					$product_data_var = array(						
						'name' =>$prod_details->data->productNameEn,
						'description' =>'',
						'content' =>'',
						'status' =>'published',
						'images' =>$product_image,
						'sku' =>$variants->variantSku,
						'order'=>0,
						'quantity'=>100000,
						'allow_checkout_when_out_of_stock'=>0,
						'with_storehouse_management'=>1,
						'is_featured'=>0,
						'brand_id'=>0,
						'is_variation'=>1,
						'sale_type'=>0,
						'price'=>$variants->variantSellPrice + $commision_variation	,
						'sale_price'=>$variants->variantSellPrice + $commision_variation,
						'start_date'=>'',
						'end_date'=>'',
						//'is_cj_image' => $filenames,
						//'image' => $filenames,
						'length'=>$variants->variantLength,
						'wide'=>'',
						'height'=>$variants->variantHeight,
						'weight'=>$variants->variantWeight,
						'tax_id'=>'',
						'created_at'=>date('Y-m-d h:s:i'),
						'stock_status'=>'in_stock',
						'store_id'=>$store_id,
					
					);
					//$variant_product_id = DB::table('ec_products')->insertGetId($product_data_var);
					$check_data_vari = DB::table('ec_products')->where('sku',$variants->variantSku)->where('store_id',$store_id)->first();
					if($check_data_vari){
						$product_insert_vari = DB::table('ec_products')->where('sku' ,$variants->variantSku)->where('store_id' ,$store_id)->update($product_data_var);	
						$variant_product_id = $check_data_vari->id;
					}else{
						$variant_product_id = DB::table('ec_products')->insertGetId($product_data_var);	
					}
					if($variant_product_id){
						
						if($variankeys == 0){
							$product_variation_data=array(
								'product_id'=> $variant_product_id,
								'configurable_product_id'=>$product,
								'is_default'=>1,
							);
						}else{
							$product_variation_data=array(
								'product_id'=> $variant_product_id,
								'configurable_product_id'=>$product,
								'is_default'=>0,
							);
						}
						$check_prod_vari = 	DB::table('ec_product_variations')->select('*')->where('product_id',$variant_product_id)->where('configurable_product_id',$product)->first();
						if($check_prod_vari){
							$variation_insert_var = DB::table('ec_product_variations')->select('*')->where('product_id',$variant_product_id)->where('configurable_product_id',$product)->update($product_variation_data);
							$variation_id = $check_prod_vari->id;
						}else{
							$variation_insert = DB::table('ec_product_variations')->insertGetId($product_variation_data);
							$variation_id = $variation_insert;
						}
							
					}
					if($variant_product_id){
						$variantKey_name = explode('-',$variants->variantKey);
						foreach($variantKey_name as $vari_Key => $attribute_name){
							$variants_type = explode('-',$prod_details->data->productKeyEn);
							$attribute_set_name = $variants_type[$vari_Key];
							$attribute_sets = DB::table('ec_product_attribute_sets')->select('*')->where(['title' => $attribute_set_name])->first();
							$attribute_sets_id = $attribute_sets->id; 
							
							$variantKeys = DB::table('ec_product_attributes')->select('*')->where(['title' => $attribute_name])->first();
							if($variantKeys && !empty($variantKeys)){
							$variantKeys_attri_id = $variantKeys->id;
						  
							}else{												  
								if($variants_type[$vari_Key] == "Color"){
									if($attribute_name){
										$ColorCode = $this->color_name_to_hex($attribute_name);
									}else{
										$ColorCode = '#26acf5';
									}
								/*	$image_url = $variants->variantImage;
									$ch = curl_init();
									curl_setopt($ch, CURLOPT_POST, 0);
									curl_setopt($ch,CURLOPT_URL,$image_url);	
									curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
									$image_result=curl_exec($ch);
									curl_close($ch);
									$filename = 'products\/'.rand(10,1000).basename($image_url);
									//dd($prod->pid.'_'.$filename);
									$path = public_path('storage/').$filename;
									//dd($path);
									if(file_exists($path)){
											unlink($path);
										}
									
									$fp = fopen($path,'x');
									fwrite($fp, $image_result);
									fclose($fp);
									*/
									$variantKeys_attri_data = array(
													'attribute_set_id' => $attribute_sets_id,
													'title' => $attribute_name,
													'slug' => strtolower($attribute_name),
													'color' => $ColorCode,
													//'is_cj' => 1,
													//'image' => $filename,
													'status' => 'published',
													'created_at'=> date('Y-m-d h:i:s'),
									  );
									$variantKeys_attri_insert = DB::table('ec_product_attributes')->insertGetId($variantKeys_attri_data);
									$variantKeys_attri_id = $variantKeys_attri_insert; 
									 
								}else{
									$variantKeys_attri_data = array(
										'attribute_set_id' => $attribute_sets_id,
										'title' => $attribute_name,
										'slug' => strtolower($attribute_name),
										//'is_cj' => 1,
										'status' => 'published',
										'created_at'=> date('Y-m-d h:i:s'),
									);
									$variantKeys_attri_insert = DB::table('ec_product_attributes')->insertGetId($variantKeys_attri_data);
									$variantKeys_attri_id = $variantKeys_attri_insert; 
								}	
							  
							}
						
							
							if($variation_id != '' &&  $variantKeys_attri_id != '') {
								$product_variation_items=array(
									'attribute_id'=> $variantKeys_attri_id,
									'variation_id'=>$variation_id
								);
								$variation_insert = DB::table('ec_product_variation_items')->insertGetId($product_variation_items);
								/*$check_variation_items = DB::table('ec_product_variation_items')->where('attribute_id',$variantKeys_attri_id)->where('variation_id',$variation_id)->first();
								if($check_variation_items){
									$variation_insert = DB::table('ec_product_variation_items')->where('attribute_id',$variantKeys_attri_id)->where('variation_id',$variation_id)->update($product_variation_items);
									$variation_id = $variation_insert;	
								}else{
									$variation_insert = DB::table('ec_product_variation_items')->insertGetId($product_variation_items);
									$variation_id = $variation_insert;	
								}
								*/
								
							}
						}
						
					}
				
			}	
			
			
		}
	}

	protected function get_access_token($api_url,$client,$request){


		$data         = ["email" => "jade@aussiedigital.io","password"=>"5354f9be28114803ab2baa7231aa4577"];
		$result_1     = $client->post($api_url, [
							'headers' => ['Content-Type' => 'application/json'],
							'body' => json_encode($data)
						]);
  
		$response       = json_decode($result_1->getBody()->getContents());
  
		if($response->message == 'Success'){
		  return $response->data->accessToken;
		}else{
		  return response()->json(['status' => 0, 'message' => "Something went wrong in access toekn api", 'data' => '']);
  
		}
  
	  }
    
	public function color_name_to_hex($color_name)
	{
		// standard 147 HTML color names
		$colors  =  array(
			'Alice blue'=>'#F0F8FF',
			'Antique white'=>'#FAEBD7',
			'Aqua'=>'#00FFFF',
			'Aquamarine'=>'#7FFFD4',
			'Azure'=>'#F0FFFF',
			'Aeige'=>'#F5F5DC',
			'Aisque'=>'#FFE4C4',
			'Black'=>'#000000',
			'Blanchedalmond '=>'#FFEBCD',
			'Blue'=>'#0000FF',
			'Blueviolet'=>'#8A2BE2',
			'Brown'=>'#A52A2A',
			'Burlywood'=>'#DEB887',
			'Cadet blue'=>'#5F9EA0',
			'Chartreuse'=>'#7FFF00',
			'Chocolate'=>'#D2691E',
			'Coral'=>'#FF7F50',
			'Cornflower blue'=>'#6495ED',
			'Cornsilk'=>'#FFF8DC',
			'Crimson'=>'#DC143C',
			'Cyan'=>'#00FFFF',
			'Dark blue'=>'#00008B',
			'Dark cyan'=>'#008B8B',
			'Dark goldenrod'=>'#B8860B',
			'Dark gray'=>'#A9A9A9',
			'Dark green'=>'#006400',
			'Dark grey'=>'#A9A9A9',
			'Dark khaki'=>'#BDB76B',
			'Dark magenta'=>'#8B008B',
			'Dark olivegreen'=>'#556B2F',
			'Dark orange'=>'#FF8C00',
			'Dark orchid'=>'#9932CC',
			'Dark red'=>'#8B0000',
			'Dark salmon'=>'#E9967A',
			'Dark seagreen'=>'#8FBC8F',
			'Farkslate blue'=>'#483D8B',
			'Farkslate gray'=>'#2F4F4F',
			'Farkslate grey'=>'#2F4F4F',
			'Fark turquoise'=>'#00CED1',
			'Farkviolet'=>'#9400D3',
			'Feep pink'=>'#FF1493',
			'Feep skyblue'=>'#00BFFF',
			'Fimgray'=>'#696969',
			'Fimgrey'=>'#696969',
			'Fodgerblue'=>'#1E90FF',
			'Firebrick'=>'#B22222',
			'Floralwhite'=>'#FFFAF0',
			'Forestgreen'=>'#228B22',
			'Fuchsia'=>'#FF00FF',
			'Gainsboro'=>'#DCDCDC',
			'Ghostwhite'=>'#F8F8FF',
			'Gold'=>'#FFD700',
			'Goldenrod'=>'#DAA520',
			'Gray'=>'#808080',
			'Green'=>'#008000',
			'Greenyellow'=>'#ADFF2F',
			'Grey'=>'#808080',
			'Honeydew'=>'#F0FFF0',
			'Hotpink'=>'#FF69B4',
			'Indian red'=>'#CD5C5C',
			'Indigo'=>'#4B0082',
			'Ivory'=>'#FFFFF0',
			'Khaki'=>'#F0E68C',
			'Lavender'=>'#E6E6FA',
			'Laven derblush'=>'#FFF0F5',
			'Lawn green'=>'#7CFC00',
			'Lemonchiffon'=>'#FFFACD',
			'Light blue'=>'#ADD8E6',
			'Light coral'=>'#F08080',
			'Light cyan'=>'#E0FFFF',
			'Light goldenrodyellow'=>'#FAFAD2',
			'Light gray'=>'#D3D3D3',
			'Light green'=>'#90EE90',
			'Light grey'=>'#D3D3D3',
			'Light pink'=>'#FFB6C1',
			'Light salmon'=>'#FFA07A',
			'Light seagreen'=>'#20B2AA',
			'Light skyblue'=>'#87CEFA',
			'Light slategray'=>'#778899',
			'Light slategrey'=>'#778899',
			'Light steelblue'=>'#B0C4DE',
			'Light yellow'=>'#FFFFE0',
			'Lime'=>'#00FF00',
			'Limegreen'=>'#32CD32',
			'Linen'=>'#FAF0E6',
			'Magenta'=>'#FF00FF',
			'Maroon'=>'#800000',
			'Mediumaquamarine'=>'#66CDAA',
			'Mediumblue'=>'#0000CD',
			'Mediumorchid'=>'#BA55D3',
			'Mediumpurple'=>'#9370D0',
			'Mediumseagreen'=>'#3CB371',
			'Mediumslateblue'=>'#7B68EE',
			'Mediumspringgreen'=>'#00FA9A',
			'Mediumturquoise'=>'#48D1CC',
			'Mediumvioletred'=>'#C71585',
			'Midnightblue'=>'#191970',
			'Mintcream'=>'#F5FFFA',
			'Mistyrose'=>'#FFE4E1',
			'Moccasin'=>'#FFE4B5',
			'Navajowhite'=>'#FFDEAD',
			'Navy'=>'#000080',
			'Oldlace'=>'#FDF5E6',
			'Olive'=>'#808000',
			'Olivedrab'=>'#6B8E23',
			'Orange'=>'#FFA500',
			'Orange red'=>'#FF4500',
			'Orchid'=>'#DA70D6',
			'Palegoldenrod'=>'#EEE8AA',
			'Palegreen'=>'#98FB98',
			'Paleturquoise'=>'#AFEEEE',
			'Palevioletred'=>'#DB7093',
			'Papayawhip'=>'#FFEFD5',
			'Peachpuff'=>'#FFDAB9',
			'Peru'=>'#CD853F',
			'Pink'=>'#FFC0CB',
			'Plum'=>'#DDA0DD',
			'Powder blue'=>'#B0E0E6',
			'Purple'=>'#800080',
			'Red'=>'#FF0000',
			'Rosy brown'=>'#BC8F8F',
			'Royal blue'=>'#4169E1',
			'saddlebrown'=>'#8B4513',
			'salmon'=>'#FA8072',
			'Sandybrown'=>'#F4A460',
			'Seagreen'=>'#2E8B57',
			'Seashell'=>'#FFF5EE',
			'Sienna'=>'#A0522D',
			'Silver'=>'#C0C0C0',
			'Sky blue'=>'#87CEEB',
			'Slate blue'=>'#6A5ACD',
			'Slate gray'=>'#708090',
			'Slate grey'=>'#708090',
			'Snow'=>'#FFFAFA',
			'Spring green'=>'#00FF7F',
			'Steel blue'=>'#4682B4',
			'Tan'=>'#D2B48C',
			'Teal'=>'008080',
			'Thistle'=>'#D8BFD8',
			'Tomato'=>'#FF6347',
			'Turquoise'=>'#40E0D0',
			'Violet'=>'#EE82EE',
			'Wheat'=>'#F5DEB3',
			'White'=>'#FFFFFF',
			'White smoke'=>'#F5F5F5',
			'Yellow'=>'#FFFF00',
			'Yellow green'=>'#9ACD32');

		$color_name = ($color_name);
		if (isset($colors[$color_name]))
		{
			return ($colors[$color_name]);
		}else{
			return '#26acf5';
		}
		
	}

}
