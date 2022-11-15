<style>
	
button {
  background: cornflowerblue;
  color: white;
  border: none;
  padding: 10px;
  border-radius: 8px;
  font-family: 'Lato';
  margin: 5px;
  text-transform: uppercase;
  cursor: pointer;
  outline: none;
}

button:hover {
  background: orange;
}
</style>
<style type="text/css">
#loader {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  background: rgba(0,0,0,0.75) url('/loader.gif') no-repeat center center;
  z-index: 10000;
}
</style>

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
						<form  method="post"  id="submit">
						@csrf
						<div class="col-md-12 row">
							@if($category_data)
								@foreach($category_data as $key => $category)
									<div class="col-md-3">
										<div class="form-group">
										  <label><input type="checkbox" class="" name="category_ids" id="category_ids" value="{{$category->category_cj_id}}">{{$category->name}}</label>
										</div>
									</div>
								@endforeach	
							@endif
						</div>
						<div class="col-md-12 row">
							
							<div class="col-md-4">
							</div>
							<div class="col-md-3" style="">
							<label>Enter Page Number</label>
								<input type="number" name="page_number" id="page_number" class="form-control" value="1" min="1"  required>
							</div>
							<div class="col-md-3" style="">
								<label>Enter Next Page Number</label>
								<input type="number" name="next_page_number" id="next_page_number" class="form-control" value="1" min="1" max="10" required>
							</div>
							<div class="col-md-2 pt-3" style="text-align: right;    margin-top: 11px;">
								<input type="submit" class="btn btn-primary" value="Import Product">
							</div>
							
						</div>
						<div>
						

						</form>
					</div>
					
                </div>
                </div>
                </div>
            </div>
           
        </div>
   
</div>
<div id="loader">Product Import </div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>

<script>
	$( document ).ready( function( $ ) {
		

		$( '#submit' ).on( 'submit', function(e) {
			var spinner = $('#loader');
			e.preventDefault();
			   Swal.fire({
				title: 'Do you want to import poroduct?',
				showDenyButton: true,
				//showCancelButton: true,
				confirmButtonText: 'Yes',
				denyButtonText: 'No',
				customClass: {
					actions: 'my-actions',
					confirmButton: 'order-2',
					cancelButton: 'order-1 ',
					
					//denyButton: 'order-3',
				}
				}).then((result) => {
					
				if (result.isConfirmed) {
					spinner.show();
					
					insert_product();
				} else if (result.isDenied) {
					spinner.hide();
					//Swal.fire('Changes are not saved', '', 'info')
				}
				})
			

		});
	});

	function insert_product(){
		
		    var spinner = $('#loader');
			var checkboxes = $('input[name="category_ids"]:checked').val();
			
			var category_ids =checkboxes;
			var page_number = $('#page_number').val();
			var next_page_number = $('#next_page_number').val();
			
			console.log(page_number);
			$.ajax({
				type: "POST",
				url: "{{route('marketplace.vendor.importcjproduct.get_products_from_dropship_category')}}",
				data:{page_number:page_number,category_ids:category_ids}
			}).done(function( msg ) {
				

				page_number = parseInt(page_number) + 1;
				$('#page_number').val(page_number);	
				

				if(page_number >= next_page_number){
					spinner.hide();
					Swal.fire({
					title: msg,
					confirmButtonText: 'OK',
					customClass: {
						actions: 'my-actions',
						confirmButton: 'order-2',
					}
					}).then((result) => {
						if (result.isConfirmed) {
							
							location.reload();
						}
					});
				}else{
					insert_product();
				}
				/*Swal.fire({
				title: msg,
				confirmButtonText: 'OK',
				customClass: {
					actions: 'my-actions',
					confirmButton: 'order-2',
				}
				}).then((result) => {
					if (result.isConfirmed) {
						
						location.reload();
					}
				});	*/	
			});
	}
</script>