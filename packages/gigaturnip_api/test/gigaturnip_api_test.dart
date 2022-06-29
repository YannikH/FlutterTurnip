import 'package:flutter_test/flutter_test.dart';
import 'package:gigaturnip_api/gigaturnip_api.dart';

import 'api/mock_api.dart';

GigaTurnipApiClient? _GigaTurnipApiClient;
MockApi mockApi = MockApi();
var anyTaskId = 1;
void main() {
  setUp(() async {
    await mockApi.start();

    _GigaTurnipApiClient = GigaTurnipApiClient();
    // _GigaTurnipApiClient = GigaTurnipApiClient(mockApi.baseAddress);
  });

  tearDown(() {
    mockApi.shutdown();
  });

  group('GigaTurnipApiClient', () {

    group('getCampaigns should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getUserCampaignsResponse);
        await _GigaTurnipApiClient?.getCampaigns();

        mockApi.expectRequestSentTo('/api/v1/campaigns');
      });

      test(
          'throws UnknownErrorException if there is error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getCampaigns(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserCampaigns should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getUserCampaignsResponse);
        await _GigaTurnipApiClient?.getUserCampaigns();

        mockApi.expectRequestSentTo('/api/v1/campaigns/list_user_campaigns');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getUserCampaigns(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getSelectableCampaigns', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getSelectableCampaignsResponse);
        await _GigaTurnipApiClient?.getSelectableCampaigns();

        mockApi.expectRequestSentTo('/api/v1/campaigns/list_user_selectable');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getSelectableCampaigns(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserRelevantTaskStages should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getUserRelevantTaskStagesResponse);
        await _GigaTurnipApiClient?.getUserRelevantTaskStages();

        mockApi.expectRequestSentTo('/api/v1/campaigns/user_relevant');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getUserRelevantTaskStages(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getTasks should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getTasksResponse);
        await _GigaTurnipApiClient?.getTasks();

        mockApi.expectRequestSentTo('/api/v1/tasks');
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getTasks(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserSelectableTasks should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getUserSelectableTasksResponse);
        await _GigaTurnipApiClient?.getUserSelectableTasks();

        mockApi.expectRequestSentTo('/api/v1/tasks/user_selectable');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getUserSelectableTasks(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserRelevantTasks should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getUserRelevantTasksResponse);
        await _GigaTurnipApiClient?.getUserRelevantTasks();

        mockApi.expectRequestSentTo('/api/v1/tasks/user_relevant');
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getUserRelevantTasks(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getTaskById should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getTaskByIdResponse);
        await _GigaTurnipApiClient?.getTaskById(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/$anyTaskId');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.getTaskById(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getTaskById(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getIntegratedTasks should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getIntegratedTasksResponse);
        await _GigaTurnipApiClient?.getIntegratedTasks(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/get_integrated_tasks');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.getIntegratedTasks(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getIntegratedTasks(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getDisplayedPreviousTasks should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getDisplayedPreviousTasksResponse);
        await _GigaTurnipApiClient?.getIntegratedTasks(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/list_displayed_previous');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.getDisplayedPreviousTasks(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getDisplayedPreviousTasks(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('openPreviousTask should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: openPreviousTaskResponse);
        await _GigaTurnipApiClient?.openPreviousTask(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/open_previous');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.openPreviousTask(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.openPreviousTask(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('releaseTask should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: releaseTaskResponse);
        await _GigaTurnipApiClient?.releaseTask(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/release_assignment');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.releaseTask(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.releaseTask(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('requestTask should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: requestTaskResponse);
        await _GigaTurnipApiClient?.requestTask(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/request_assignment');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.requestTask(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.requestTask(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('triggerTaskWebhook should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: triggerTaskWebhookResponse);
        await _GigaTurnipApiClient?.triggerTaskWebhook(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/trigger_webhook');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.triggerTaskWebhook(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.triggerTaskWebhook(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('reopenTask should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: reopenTaskResponse);
        await _GigaTurnipApiClient?.reopenTask(id: anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/uncomplete');
      });

      test(
          'throws ItemNotFoundException if there is no task with the passed id',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 404);

        expect(() => _GigaTurnipApiClient?.reopenTask(id: anyTaskId),
            throwsA(isInstanceOf<ItemNotFoundException>()));
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.reopenTask(id: anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getNotifications should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getNotificationsResponse);
        await _GigaTurnipApiClient?.getCampaigns();

        mockApi.expectRequestSentTo('/api/v1/notifications');
      });

      test(
          'throws UnknownErrorException if there is error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getNotifications(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserNotifications should', () {

      test('sends get request to the correct endpoint', () async {
        // await mockApi.enqueueMockResponse(fileName: getUserNotificationsResponse);
        await _GigaTurnipApiClient?.getCampaigns();

        mockApi.expectRequestSentTo('/api/v1/notifications/list_user_notifications');
      });

      test(
          'throws UnknownErrorException if there is error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient?.getUserNotifications(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

  });
}

