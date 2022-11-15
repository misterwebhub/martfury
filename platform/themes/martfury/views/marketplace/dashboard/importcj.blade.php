@extends(MarketplaceHelper::viewPath('dashboard.layouts.master'))
@section('content')
    
    <section class="ps-dashboard report-chart-content" id="report-chart">
        @include(MarketplaceHelper::viewPath('dashboard.partials.dashboard-contentimportcj'))
    </section>
@stop

@push('footer')
    <script>
        var BotbleVariables = BotbleVariables || {};
        BotbleVariables.languages = BotbleVariables.languages || {};
        BotbleVariables.languages.reports = {!! json_encode(trans('plugins/ecommerce::reports.ranges'), JSON_HEX_APOS) !!}
    </script>
@endpush
