<?php

namespace Botble\Ads\Http\Controllers;

use Botble\Ads\Forms\AdsForm;
use Botble\Ads\Forms\AdsManagementsForm;
use Botble\Ads\Forms\PaidAdsManagementsForm;
use Botble\Ads\Http\Requests\AdsManagementsRequest;
use Botble\Ads\Http\Requests\AdsRequest;
use Botble\Ads\Http\Requests\PaidAdsManagementsRequest;
use Botble\Ads\Repositories\Eloquent\AdsManagementsRepository;
use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Ads\Repositories\Interfaces\AdsManagementsInterface;
use Botble\Ads\Repositories\Interfaces\PaidAdsManagementsInterface;
use Botble\Ads\Tables\AdsManagementsTable;
use Botble\Ads\Tables\AdsTable;
use Botble\Ads\Tables\PaidAdsManagementsTable;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Marketplace\Http\Requests\NoValidationRequest;
use Botble\Marketplace\Http\Requests\VendorPaidAdsRequest;
use Botble\Marketplace\Models\VendorPaidAds;
use Botble\Marketplace\Repositories\Interfaces\VendorPaidAdsInterface;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Throwable;

class PaidAdsManagementsController extends BaseController
{
    /**
     * @var AdsInterface
     */
    protected $adsRepository;

    /**
     * @param AdsInterface $adsRepository
     */
    public function __construct(VendorPaidAdsInterface $adsRepository)
    {
        $this->adsRepository = $adsRepository;
    }

    /**
     * @param AdsTable $table
     * @return Factory|View
     * @throws Throwable
     */
    public function index(PaidAdsManagementsTable $table)
    {
        page_title()->setTitle(trans('plugins/ads::ads.name'));

        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/ads::ads.create'));

        return $formBuilder->create(PaidAdsManagementsForm::class)->renderForm();
    }

    /**
     * @param AdsRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(NoValidationRequest $request, BaseHttpResponse $response)
    {

        $ads = $this->adsRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(ADS_MODULE_SCREEN_NAME, $request, $ads));

        return $response
            ->setPreviousUrl(route('paid_ads_managements.index'))
            ->setNextUrl(route('paid_ads_managements.edit', $ads->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param $id
     * @param Request $request
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request)
    {

        $ads = $this->adsRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $ads));

        page_title()->setTitle(trans('plugins/ads::ads.edit') . ' "' . $ads->name . '"');
        // dd("helo form submitted");

        return $formBuilder->create(PaidAdsManagementsForm::class, ['model' => $ads])->renderForm();
    }

    /**
     * @param int $id
     * @param AdsRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, NoValidationRequest $request, BaseHttpResponse $response)
    {
        $ads = $this->adsRepository->findOrFail($id);
        $ads->status = $request->status;
        $ads->save();
        return $response
            ->setPreviousUrl(route('paid_ads_managements.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $ads = $this->adsRepository->findOrFail($id);

            $this->adsRepository->delete($ads);

            event(new DeletedContentEvent(ADS_MODULE_SCREEN_NAME, $request, $ads));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $ads = $this->adsRepository->findOrFail($id);
            $this->adsRepository->delete($ads);
            event(new DeletedContentEvent(ADS_MODULE_SCREEN_NAME, $request, $ads));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
