{!! Form::open(['url' => $url]) !!}

    <div class="form-group">
        <label for="shipment-status" class="control-label">{{ trans('plugins/ecommerce::shipping.status') }}</label>
        {!! Form::customSelect('status', [
            \Botble\Ecommerce\Enums\ShippingStatusEnum::ARRANGE_SHIPMENT => \Botble\Ecommerce\Enums\ShippingStatusEnum::ARRANGE_SHIPMENT()->label(),
            \Botble\Ecommerce\Enums\ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT => \Botble\Ecommerce\Enums\ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT()->label()
        ], $shipment->status) !!}
    </div>

{!! Form::close() !!}
