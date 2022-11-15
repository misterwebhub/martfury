<div class="ps-section__left">
    


    
        <hr>
        <div class="ps-card">
            <div class="ps-card__header">
                <h4>{{ __('Please Choose Category') }}</h4>
            </div>
            <div class="ps-card__content">
				<div class="main-form">
				<div class="form-body">
					<div class="row">
						<form action="{{route('marketplace.vendor.importcjproduct.get_products_from_dropship_category')}}" method="post">
						@csrf
						<div class="col-md-12 row">
							@if($category_data)
								@foreach($category_data as $key => $category)
									<div class="col-md-3">
										<div class="form-group">
										  <label><input type="checkbox" class="" name="category_ids[]" value="{{$category->category_cj_id}}">{{$category->name}}</label>
										</div>
									</div>
								@endforeach	
							@endif
						</div>
						<div class="col-md-12 row">
							
							<div class="col-md-9">
							</div>
							<div class="col-md-3" style="text-align: right;">
								<input type="submit" class="btn btn-primary" value="Import Product">
							</div>
						</div>
						</form>
					</div>
					
                </div>
                </div>
                </div>
            </div>
           
        </div>
   
</div>

