@extends(MarketplaceHelper::viewPath('dashboard.layouts.master'))

@section('content')
    <div class="ps-card__content">
        {!! Form::open([
            'route' => 'marketplace.vendor.ads-managements.create',
            'class' => 'ps-form--account-setting',
            'id' => 'vendor_paid_ads_form',
            'method' => 'POST',
            'enctype' => 'multipart/form-data',
        ]) !!}
        <div class="ps-form__content">
            <div class="tab-content">
                <div class="tab-pane active" id="tab_information">
                    <div class="row">
                        <input type="hidden" name="ads_paid_id" value="{{ isset($ads_paid_id) ? $ads_paid_id : '' }}">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="ads_name" class="required">{{ __('Ads Name') }}</label>
                                <input class="form-control" name="name" id="name" type="text"
                                    value="{{ old('name', isset($ads_info) ? $ads_info->name : '') }}"
                                    placeholder="{{ __('Ads Name') }}">
                                @if ($errors->has('name'))
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                @endif
                            </div>
                            <button type="button" class="btn btn-info" data-bs-toggle="modal"
                                data-bs-target="#show_booking_slot_modal">
                                View Booked Slot
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="show_booking_slot_modal" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info">
                                            <h5 class="modal-title" id="exampleModalLabel">All Booking Slot</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Space Name</th>
                                                        <th scope="col">Start Date</th>
                                                        <th scope="col">End Date</th>
                                                        <th scope="col">Ads Hour</th>
                                                        <th scope="col">Created At</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($slof_info_array as $key => $item)
                                                        <tr>
                                                            <th scope="row">{{ $key + 1 }}</th>
                                                            <th>{{ $item->get_ads_space_name($item->ads_space_id) }}</th>
                                                            <td>{{ $item->start_date }}</td>
                                                            <td>{{ $item->end_date }}</td>
                                                            <td>{{ $item->ads_hour }}</td>
                                                            <td>{{ $item->created_at }}</td>
                                                        </tr>
                                                    @endforeach

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="button" class="btn btn-info" data-bs-toggle="modal"
                                data-bs-target="#show_available_slot_modal">
                                View Available Slot
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="show_available_slot_modal" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info">
                                            <h5 class="modal-title" id="exampleModalLabel">All Slot's</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="slide">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="choose_space_id">Choose Ads Space</label>
                                                            <select class="form-control" id="choose_ads_space_id">
                                                                @foreach (EcommerceHelper::get_ads_space_management() as $value)
                                                                    <option rel="{{ $value->price_per_hour }}"
                                                                        is-banner="{{ $value->is_banner }}"
                                                                        image-limit="{{ $value->image_limit }}"
                                                                        data-message="{{ $value->image_label }}"
                                                                        value="{{ $value->id }}">
                                                                        {{ $value->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-8">
                                                        <div class="form-group">
                                                            <label for="choose_date">Choose Booking Date</label>
                                                            <input type="text" class="form-control" id="choose_date">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Booking Date</th>
                                                        <th scope="col">Booking Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="booking_slot_status_body">

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-sm-6">
                            <div class="form-group @if ($errors->has('ads_space_id')) has-error @endif">
                                <label for="ads_space_id">{{ __('Ads Space') }}</label>
                                <select name="ads_space_id" class="form-control" id="ads_space_id">
                                    @foreach (EcommerceHelper::get_ads_space_management() as $value)
                                        <option rel="{{ $value->price_per_hour }}" is-banner="{{ $value->is_banner }}"
                                            image-limit="{{ $value->image_limit }}"
                                            data-message="{{ $value->image_label }}" value="{{ $value->id }}"
                                            @if (old('ads_space_id', isset($ads_info) ? $ads_info->ads_space_id : '') == $value->id) ) selected @endif>
                                            {{ $value->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <button type="button" class="btn btn-info" data-bs-toggle="modal"
                                data-bs-target="#show_space_pricing_model">
                                View Space's Pricing
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="show_space_pricing_model" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info">
                                            <h5 class="modal-title" id="exampleModalLabel">All Space's Pricing</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Space Name</th>
                                                        <th scope="col">Price Per Hour</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach (EcommerceHelper::get_ads_space_management() as $key => $value)
                                                        <tr>
                                                            <th scope="row">{{ $key + 1 }}</th>
                                                            <td>{{ $value->name }}</td>
                                                            <td>{{ $value->price_per_hour }}</td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">

                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="start_date" class="required">{{ __('Start Date') }}</label>
                                <input class="form-control" name="start_date" id="start_date" type="text"
                                    placeholder="{{ __('Start Date') }}">
                                @if ($errors->has('start_date'))
                                    <span class="text-danger">{{ $errors->first('start_date') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="end_date" class="required">{{ __('End Date') }}</label>
                                <input class="form-control" name="end_date" id="end_date" type="text"
                                    placeholder="{{ __('End Date') }}">
                                @if ($errors->has('end_date'))
                                    <span class="text-danger">{{ $errors->first('end_date') }}</span>
                                @endif
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="ads_hour_element" class="required">{{ __('Ads Hour') }}</label>
                                <input type="text" class="form-control" name="ads_hour_element" id="ads_hour_element"
                                    disabled>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="price_per_hour_element" class="required">{{ __('Price Per Hour') }}</label>
                                <input type="text" class="form-control" name="price_per_hour_element"
                                    id="price_per_hour_element" disabled>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="total_paid_amount">Total Paid Amount</label>
                                <input type="text" class="form-control" name="total_paid_amount_element"
                                    id="total_paid_amount_element" disabled>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="link">LINK</label>
                                <input type="text" class="form-control" name="link" id="link"
                                    value="{{ isset($ads_info) ? $ads_info->link : '#' }}">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="logo">{{ __('Banner Image') }}</label>
                                <p class="text-warning" id="label_message_element">Message</p>
                                {!! Form::customImage('banner_image', old('banner_image', isset($ads_info) ? $ads_info->banner_image : '')) !!}
                                {!! Form::error('banner_image', $errors) !!}
                                @if (isset($ads_info) && $ads_info->banner_image)
                                    <input type="hidden" name="banner_image_input" value="none">
                                @endif
                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <div class="form-group text-center">
                <div class="form-group submit">
                    <div class="ps-form__submit text-center">
                        <button class="ps-btn success">{{ __('Submit') }}</button>
                    </div>
                </div>
            </div>
        </div>
        {{-- modal --}}
        <div class="modal fade" id="already_booking_slot" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">This Slot Already Booked, Try Different Date</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Start Date</th>
                                    <th scope="col">End Date</th>
                                    <th scope="col">Ads Hour</th>
                                    <th scope="col">Created At</th>
                                </tr>
                            </thead>
                            <tbody id="already_booking_slot_row">


                            </tbody>
                        </table>
                    </div>
                    <div id="input_hidden_field">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        {{-- modal --}}

        {!! Form::close() !!}
    </div>
@section('jquery-logic')


    <script>
        /**
         * View Available Slot Booking Logic Start
         */

        var choose_ads_space_id_element = $("#choose_ads_space_id");
        var choose_date_element = $("#choose_date");
        var choose_ads_space_id;
        var choose_date;
        var show_available_slot_modal = $("#show_available_slot_modal");
        var booking_slot_status_body_element = $("#booking_slot_status_body");

        $(function() {
            let chooseMinDate = new Date();
            chooseMinDate.setHours(chooseMinDate.getHours() - 24);
            $('#choose_date').datetimepicker({
                format: 'YYYY/MM/DD',
                defaultDate: new Date(),
                minDate: chooseMinDate
            }).on('dp.hide', function(ev) {
                choose_date = choose_date_element.val();
                show_available_slot();
            });
        });

        $(document).ready(function() {
            // show_available_slot_modal.modal('show');
            choose_ads_space_id = choose_ads_space_id_element.val();
            choose_date = choose_date_element.val();
            show_available_slot();
        });

        choose_ads_space_id_element.change(function() {
            choose_ads_space_id = $(this).val();
            show_available_slot();
        })

        function show_available_slot() {
            if (choose_ads_space_id != '' && choose_date != '') {
                booking_slot_status_body_element.html(``);
                $.ajax({
                    type: 'get',
                    data: {
                        ads_space_id: choose_ads_space_id,
                        choose_date: choose_date
                    },
                    url: "{{ url('vendor/api/ads-managements/show-available-slot') }}",
                    success: function(response) {
                        if (response.status == true) {
                            let booking_data = response.data;
                            for (let index = 0; index < booking_data.length; index++) {
                                let numberIndex = index + 1;
                                let slot_booked_status;
                                if (booking_data[index]['is_slot_booked'] == true) {
                                    slot_booked_status = "<span style='color:red;'>BOOKED</span>";
                                } else {
                                    slot_booked_status = "<span style='color:green;'>AVAILABLE</span>";
                                }
                                booking_slot_status_body_element.append(`
                            <tr>
                                <td scope="col">` + numberIndex + `</td>
                                <td scope="col">` + booking_data[index]['date_hour'] + `</td>
                                <td>` + slot_booked_status + `</td>
                            </tr>
                            
                            `);
                            }

                        }
                    }
                });
            }
        }





        /**
         * View Available Slot Booking Logic Start
         */
    </script>
    <script>
        var start_date_minimumDate = new Date();
        var end_date_minimumDate = new Date();
        var start_date = $("#start_date");
        var end_date = $("#end_date");
        var start_date_ok_btn = $("#start_date_ok_btn");
        var end_date_ok_btn = $("#end_date_ok_btn");
        var ads_hour = 0;
        var already_booking_slot_row = $("#already_booking_slot_row");
        var ads_space_id = $("#ads_space_id");
        var ads_space_check_banner;
        var ads_space_image_limit;
        var ads_hour_element = $("#ads_hour_element");
        var price_per_hour = 0;
        var price_per_hour_element = $("#price_per_hour_element");
        var paid_amount = 0;
        var total_paid_amount_element = $("#total_paid_amount_element");
        var label_message_element = $("#label_message_element");
        var is_edit = "{{ isset($ads_info) ? 'YES' : 'NO' }}";

        $(document).ready(function() {
            ads_hour_element.val({{ isset($ads_info) ? $ads_info->ads_hour : 0 }});
            total_paid_amount_element.val({{ isset($ads_info) ? $ads_info->total_amount : 0 }});
            price_per_hour = ads_space_id.find('option:selected').attr('rel');
            ads_space_check_banner = ads_space_id.find('option:selected').attr('is-banner');
            ads_space_image_limit = ads_space_id.find('option:selected').attr('image-limit');
            price_per_hour_function(price_per_hour);
            label_message_element.text($(this).find('option:selected').attr('data-message'));
        });

        // function set_default_min_date() {
        //     let current_date_number = Date.now();
        //     let db_start_date_number = Date.parse("{{ isset($ads_info) ? $ads_info->start_date : '' }}");
        //     if (db_start_date_number < current_date_number) {
        //         start_date_minimumDate = "{{ isset($ads_info) ? $ads_info->start_date : '' }}";
        //     }
        // }


        $(function() {
            var start_date_options;
            var end_date_options;
            if (is_edit == "YES") {
                start_date_options = {
                    defaultDate: '{{ isset($ads_info) ? $ads_info->start_date : '' }}',
                    toolbarPlacement: 'top',
                    stepping: 60,
                    showClose: true,
                    icons: {
                        close: 'fa fa-times'
                    }
                };
                end_date_options = {
                    defaultDate: '{{ isset($ads_info) ? $ads_info->end_date : '' }}',
                    toolbarPlacement: 'top',
                    stepping: 60,
                    showClose: true,
                    icons: {
                        close: 'fa fa-times'
                    }
                };
            } else {
                start_date_options = {
                    toolbarPlacement: 'top',
                    stepping: 60,
                    showClose: true,
                    icons: {
                        close: 'fa fa-times'
                    },
                    minDate: start_date_minimumDate
                };
                end_date_options = {
                    toolbarPlacement: 'top',
                    stepping: 60,
                    showClose: true,
                    icons: {
                        close: 'fa fa-times'
                    },
                    minDate: end_date_minimumDate
                };
            }
            start_date.datetimepicker(start_date_options).on('dp.hide', function(ev) {
                both_date_validation();
            });

            end_date.datetimepicker(end_date_options).on('dp.hide', function(ev) {
                both_date_validation();
            });
        });


        /** both Date validation */
        function both_date_validation() {
            if (start_date.val() == '') {
                alert("Start Date Must Be Filled");
                end_date.val(``);
            } else {
                const date1 = new Date(start_date.val());
                const date2 = new Date(end_date.val());
                if (date1 > date2) {
                    alert("End Date Must be Greater than Start End");
                    end_date.val(``);
                    ads_hour_element.val(0);
                } else {
                    check_booking_slot();
                    const diffTime = Math.abs(date2 - date1);
                    const originalDiffHour = diffTime / (1000 * 60 * 60);
                    const diffhours = Math.ceil(diffTime / (1000 * 60 * 60));
                    if (originalDiffHour < 1) {
                        alert("Ads hour Must be Atleast 1 Hour");
                        end_date.val(``);
                    } else {
                        ads_hour_element.val(diffhours);
                        paid_amount = price_per_hour * diffhours;
                        total_paid_amount_element.val(paid_amount);
                    }
                }
            }
        }
        /***Both Date Validation END*/

        /**Validate Dates using db api*/
        function check_booking_slot() {
            already_booking_slot_row.html(``);
            const start_date_input = $("#start_date").val();
            const end_date_input = $("#end_date").val();
            if (start_date != '' && end_date != '') {
                $.ajax({
                    type: 'get',
                    data: {
                        ads_id: {{ isset($ads_info) ? $ads_info->id : 0 }},
                        ads_space_id: ads_space_id.val(),
                        start_date: start_date_input,
                        end_date: end_date_input
                    },
                    url: "{{ url('vendor/api/ads-managements/validate-date') }}",
                    success: function(response) {
                        ads_space_check_banner = parseInt(ads_space_check_banner);
                        ads_space_image_limit = parseInt(ads_space_image_limit);
                        /**
                         * 1 means true
                         * If Selected Ads Space is banner 
                         */
                        if (ads_space_check_banner == 1) {
                            if (ads_space_image_limit <= response.length) {
                                booking_slot_popup_response(response);
                            }
                        } else {
                            booking_slot_popup_response(response);
                        }


                    }
                });
            }
        }
        /**Validate Dates using db api end*/

        function booking_slot_popup_response(response) {
            if (response.length > 0) {
                already_booking_slot_row.html(``);
                for (let index = 0; index < response.length; index++) {
                    already_booking_slot_row.append(`<tr>
                                                            <th scope="row">` + (index + 1) + `</th>
                                                            <td>` + response[index]['start_date'] + `</td>
                                                            <td>` + response[index]['end_date'] + `</td>
                                                            <td>` + response[index]['ads_hour'] + `</td>
                                                            <td>` + response[index]['created_at'] + `</td>
                                                        </tr>`);
                    $('#already_booking_slot').modal('show');
                    end_date.val(``);
                }
            }
        }


        /**get ads space, price per hour */
        ads_space_id.change(function() {
            price_per_hour = $(this).find('option:selected').attr('rel');
            ads_space_check_banner = $(this).find('option:selected').attr('is-banner');
            ads_space_image_limit = $(this).find('option:selected').attr('image-limit');
            ads_hour_element.val(0);
            price_per_hour_function(price_per_hour);

            label_message_element.text($(this).find('option:selected').attr('data-message'));
        });


        function price_per_hour_function(amount) {
            start_date.val(``);
            end_date.val(``);
            price_per_hour_element.val(amount);


        }
        /**get ads space, price per hour END */


        /**form validation*/
        $("#input_hidden_field").html(``);
        $("#vendor_paid_ads_form").submit(function(e) {
            e.preventDefault();

            /**Validate Condition start*/
            $("#input_hidden_field").append(`
            <input type="hidden" name="ads_hour" value="` + ads_hour_element.val() + `">
            <input type="hidden" name="total_amount" value="` + total_paid_amount_element.val() + `">
            `);

            /**Validate Condition end*/

            e.currentTarget.submit();
        });
    </script>

@endsection
@stop
