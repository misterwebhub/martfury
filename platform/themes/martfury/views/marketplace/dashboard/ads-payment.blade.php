@extends(MarketplaceHelper::viewPath('dashboard.layouts.master'))
@section('content')
    <div>
        <form action="{{ route('payments.checkout') }}" method="post" class="payment-checkout-form" id="payment_checkout_form">
            @csrf
            <ul class="list-group list_payment_method" id="list_payment_method_ul">
                <input type="hidden" name="name" value="{{ $name }}">
                <input type="hidden" name="amount" id="amount" value="{{ $amount }}">
                <input type="hidden" name="currency" id="currency" value="{{ $currency }}">
                <input type="hidden" name="return_url" id="return_url" value="{{ $returnUrl }}">
                <input type="hidden" name="callback_url" id="callback_url" value="{{ $callbackUrl }}">
                <input type="hidden" name="ads_id" id="ads_id" value="{{ $ads_id }}">
                {!! apply_filters(PAYMENT_FILTER_ADDITIONAL_PAYMENT_METHODS, null, compact('name', 'amount', 'currency')) !!}

                {{-- custom code for AUD Payments start --}}
                <li class="list-group-item">
                    <input class="magic-radio js_payment_method" type="radio" name="payment_method" id="payment_aud"
                        value="aud" data-bs-toggle="collapse" data-bs-target=".payment_aud_wrap"
                        data-parent=".list_payment_method">
                    <label for="payment_aud" class="text-start">Pay via AUD</label>
                    <div class="payment_aud_wrap payment_collapse_wrap collapse " style="padding: 15px 0;">
                        Payment with AUD
                    </div>
                </li>


                {{-- custom code for AUD payments End --}}
            </ul>
            <div class="text-center m-3">
                <button class="btn btn-success" type="submit">Pay</button>
            </div>

        </form>
    </div>
    <script>
        $("#payment_checkout_form").submit(function(e) {
            $("#list_payment_method_ul").find('.extra_input').remove();
            // e.preventDefault();
            let paymentMethod = $('input[name=payment_method]:checked').val();
            let return_url_variable = "{{ $returnUrl }}" + "/" + paymentMethod;
            let callback_url_variable = "{{ $callbackUrl }}" + "/" + paymentMethod;
            if (paymentMethod == 'aud') {
                let audUrl = "https://staging.aussiedigital.io/payment/create-token";
                $(this).attr('action', audUrl);
                let get_user_id = {{ auth('customer')->id() }};
                let order_temp_id = "{{ strtoupper(uniqid()) }}";
                let order_number = $("#ads_id").val();
                let total_price = $("#amount").val();
                let token = $("#amount").val();
                let currency = $("#currency").val();
                let domain = "{{ $returnUrl }}" + "/" + paymentMethod;
                let order_data = get_user_id + "~" + order_temp_id + "~" + order_number + "~" + total_price + "~" +
                    currency + "~" + token;
                $("#list_payment_method_ul").append(`<li class="extra_input">
                    <input type="hidden" name="orders_data" value="` + order_data + `">
                    <input type="hidden" name="flag_type" value="fixed" >
                    <input type="hidden" name="domain" value="` + domain + `" >
                    </li>`);
            } else {
                $("#return_url").val(return_url_variable);
                $("#callback_url").val(callback_url_variable);
                $(this).attr('action', "{{ route('payments.checkout') }}");
            }
            // $(this).submit();


        });
    </script>
@stop
