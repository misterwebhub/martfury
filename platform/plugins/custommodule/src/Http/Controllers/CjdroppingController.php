<?php

namespace Botble\CustomModule\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\CustomModule\Forms\PostForm;
use Botble\CustomModule\Http\Requests\PostRequest;
use Botble\CustomModule\Models\Post;
use Botble\CustomModule\Repositories\Interfaces\CategoryInterface;
use Botble\CustomModule\Repositories\Interfaces\PostInterface;
use Botble\CustomModule\Repositories\Interfaces\TagInterface;
use Botble\CustomModule\Services\StoreCategoryService;
use Botble\CustomModule\Services\StoreTagService;
use Botble\CustomModule\Tables\PostTable;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\View\View;
use Botble\Ecommerce\Imports\ValidateProductImport;
use Botble\Ecommerce\Http\Requests\ProductRequest;
use Throwable;
use GuzzleHttp\Client;
use Illuminate\Support\Str;
use Mimey\MimeTypes;
use Illuminate\Http\UploadedFile;
use RvMedia;
use DB;
use Excel;
use Botble\Ecommerce\Imports\ProductImport;

use Symfony\Component\HttpFoundation\BinaryFileResponse;
class CjdroppingController extends BaseController
{
    use HasDeleteManyItemsTrait;

    /**
     * @var PostInterface
     */
    protected $postRepository;

    /**
     * @var TagInterface
     */
    protected $tagRepository;

    /**
     * @var CategoryInterface
     */
    protected $categoryRepository;

    /**
     * @param PostInterface $postRepository
     * @param TagInterface $tagRepository
     * @param CategoryInterface $categoryRepository
     */
	  protected $productImport;

    /**
     * @var ProductImport
     */
    protected $validateProductImport;
	 
    public function __construct(
        PostInterface $postRepository,
        TagInterface $tagRepository,
        CategoryInterface $categoryRepository,
		ProductImport $productImport,
		ValidateProductImport $validateProductImport
    ) {
        $this->postRepository = $postRepository;
        $this->tagRepository = $tagRepository;
        $this->categoryRepository = $categoryRepository;
		$this->productImport = $productImport;
        $this->validateProductImport = $validateProductImport;
    }

    /**
     * @param PostTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(Request $request)
    {
         echo "hello";
    }
	
	public function get_products_from_dropship(Request $request) {
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
                if($i == 1){
					
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
                         

                $i++;
                
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
	 
	 public function get_products_from_dropship_category(Request $request){
		
			//$image = $this->save_image();
          try{


            $client       = new Client;

            $api_url    = 'https://developers.cjdropshipping.com/api2.0/v1/authentication/getAccessToken';


            $product_api_url = 'https://developers.cjdropshipping.com/api2.0/v1/product/list';

            $access_token = $this->get_access_token($api_url,$client,$request);
			
            $result_2 = $client->get($product_api_url, ['headers' => ['CJ-Access-Token' => $access_token]]);

            $products =  json_decode($result_2->getBody()->getContents());
			
            if($products->message == 'Success'){
 
              foreach($products->data->list as $prod){
				  
						
						$api_url    = 'https://developers.cjdropshipping.com/api2.0/v1/authentication/getAccessToken';
						$prod_detail_api_url = 'https://developers.cjdropshipping.com/api2.0/v1/product/query?pid='.$prod->pid;
						
						$access_token = $this->get_access_token($api_url,$client,$request);
						
						$result_2 = $client->get($prod_detail_api_url, ['headers' => ['CJ-Access-Token' => $access_token]]);
						
						$prod_details =  json_decode($result_2->getBody()->getContents());
						
						
						//dd($prod_details);
						$product_image = json_decode($prod_details->data->productImage);
						$sale_price =explode('-',$prod_details->data->sellPrice);
						
						//get image from url 
						$url = $product_image[0];
						//$url = 'https://www.gstatic.com/webp/gallery/1.jpg';
						
						/*$ch = curl_init();
						curl_setopt($ch, CURLOPT_POST, 0);
						curl_setopt($ch,CURLOPT_URL,$image_url);	
						curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
						$image_result=curl_exec($ch);
						curl_close($ch);
						$filename = 'products\/'.$prod->pid.'_'.basename($image_url);
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
						//dd($url);
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
							//dd($filename	);
							if(file_exists($path)){
								unlink($path);
							}

							
								
							file_put_contents($path, $contents);

							$mimeType = $info['extension'];
							//dd($path,$filename);
							$fileUpload = new UploadedFile($path, $filename, $mimeType, null, true);

							$result = RvMedia::handleUpload($fileUpload, 0, 'products');

						$image_array_name = array($filename);
						$product_images = json_encode($image_array_name);
						//dd($product_images);
					$product_data = array(	
					
									'name' =>$prod_details->data->productNameEn,
									'description' =>'',
									'content' =>$prod_details->data->description,
									'status' =>'published',
									'images' =>$product_images,
									'sku' =>$prod_details->data->productSku,
									'order'=>0,
									'quantity'=>10,
									'allow_checkout_when_out_of_stock'=>0,
									'with_storehouse_management'=>1,
									'is_featured'=>1,
									'brand_id'=>0,
									'is_variation'=>1,
									'sale_type'=>0,
									'price'=>$sale_price[0],
									'sale_price'=>$sale_price[0],
									'start_date'=>'',
									'end_date'=>'',
									'length'=>'',
									'wide'=>'',
									'height'=>'',
									'is_variation'=>0,
									'weight'=>$prod_details->data->packingWeight,
									'tax_id'=>1,
									'created_at'=>date('Y-m-d h:s:i'),
									'stock_status'=>'in_stock',
									'store_id'=>'',
									
									

										
						);
						$product = DB::table('ec_products')->insertGetId($product_data);
						
						
					if ($product) {
						$category_name = $prod_details->data->categoryName;
						 //$recos = Category::select('*')->where(['category_name' => $category_name])->first();
						 $recos = DB::table('ec_product_categories')->select('*')->where(['name' => $category_name])->first();
						 //$categoriess = new Category;
                          if($recos && !empty($recos)){
                            $categoriess = $recos->id;
                          
                          }else{
						
                          $categoriess_data = array(
									'name' => $prod_details->data->categoryName,
									'category_cj_id' => $prod_details->data->categoryId,
									'is_cj' => 'Yes',
									'status' => 'published',
									'order' => 3,
						  );
						  $sub_category_insert = DB::table('ec_product_categories')->insertGetId($categoriess_data);
							$categoriess = $sub_category_insert;
						  
						  
                          }
						  
							
						
							//add product id to category
							
						$product_category_id = array(
									'category_id' =>$categoriess ,
									'product_id' => $product,
									
									);	
							//dd($product_category_id);			
							$product_categories = DB::table('ec_product_category_product')->insert($product_category_id);
							
						$ec_products_translations = array(
									'lang_code' =>'vi' ,
									'ec_products_id' => $product,
									'name' => $prod_details->data->productNameEn,
									
									);	
							//dd($product_category_id);			
							$ec_products_translations_insert = DB::table('ec_products_translations')->insert($ec_products_translations);

							if($product){
								$thirdsub_slug_data = array(
										'key' => Str::slug($prod_details->data->productNameEn, '-'),
										'reference_id' => $product,
										'reference_type' => 'Botble\Ecommerce\Models\Product',
										'prefix' => 'products',								
										'created_at' => date('Y-m-d h:i:s'),
										'updated_at' => date('Y-m-d h:i:s'),
									); 
								$thirdsub_slug = DB::table('slugs')->insertGetId($thirdsub_slug_data);		
							}	
							
							foreach($prod_details->data->variants as $variation){
								
							}
							
						}
                
				//dd("done");	
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
	
	public function ImportProduct(Request $request){
			
			
			$file = public_path() . "/upload_product_file/template_products_import.csv";
			$filename = basename($file);
			$data = [
				'uploaded_file' => curl_file_create($file, 'image/jpeg', $filename),
			];
			$ch = curl_init();   
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
			
		
			
			
			$file = fopen(public_path() . "/upload_product_file/template_products_import.csv", "r");
			//$data = fgetcsv($file, 1000, ",");
			//dd($data);
			$this->validateProductImport
				->setValidatorClass(new ProductRequest)
				->import($file);
			
			if ($this->validateProductImport->failures()->count()) {
				$data = [
					'total_failed'  => $this->validateProductImport->failures()->count(),
					'total_error'   => $this->validateProductImport->errors()->count(),
					'failures'      => $this->validateProductImport->failures(),
				];

				$message = trans('plugins/ecommerce::bulk-import.import_failed_description');

				return $response
					->setError()
					->setData($data)
					->setMessage($message);
			}

			$this->productImport
				->setValidatorClass(new ProductRequest)
				->setImportType($request->input('type'))
				->import($file); // Start import
		}
  
}
