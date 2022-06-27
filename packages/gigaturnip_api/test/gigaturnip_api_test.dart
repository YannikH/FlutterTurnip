import 'package:flutter_test/flutter_test.dart';
import 'package:gigaturnip_api/gigaturnip_api.dart';

import 'api/mock_api.dart';

GigaTurnipApiClient? _GigaTurnipApiClient;
MockApi mockApi = MockApi();
void main() {
  setUp(() async {
    await mockApi.start();

    _GigaTurnipApiClient = GigaTurnipApiClient(mockApi.baseAddress);
  });

  tearDown(() {
    mockApi.shutdown();
  });

  group('GigaTurnipApiClient', () {

    group('getCampaigns should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getUserCampaignsResponse);
        await _GigaTurnipApiClient.getCampaigns();

        mockApi.expectRequestSentTo('/api/v1/campaigns');
      });

      test(
          'throws UnknownErrorException if there is error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getCampaigns(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserCampaigns should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getUserCampaignsResponse);
        await _GigaTurnipApiClient.getUserCampaigns();

        mockApi.expectRequestSentTo('/api/v1/campaigns/list_user_campaigns');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getUserCampaigns(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getSelectableCampaigns', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getSelectableCampaignsResponse);

        await _GigaTurnipApiClient.getSelectableCampaigns();

        mockApi.expectRequestSentTo('/api/v1/campaigns/list_user_selectable');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getSelectableCampaigns(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserRelevantTaskStages should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getUserRelevantTaskStagesResponse);
        await _GigaTurnipApiClient.getUserRelevantTaskStages();

        mockApi.expectRequestSentTo('/api/v1/campaigns/user_relevant');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getUserRelevantTaskStages(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getTasks should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getTasksResponse);

        await _GigaTurnipApiClient.getTasks();

        mockApi.expectRequestSentTo('/api/v1/tasks');
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getTasks(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserSelectableTasks should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getUserSelectableTasksResponse);
        await _GigaTurnipApiClient.getUserSelectableTasks();

        mockApi.expectRequestSentTo('/api/v1/tasks/user_selectable');
      });

      test(
          'throws UnknownErrorException if there is not handled error',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getUserSelectableTasks(anyTask),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getUserRelevantTasks should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getUserRelevantTasksResponse);
        await _GigaTurnipApiClient.getUserRelevantTasks();

        mockApi.expectRequestSentTo('/api/v1/tasks/user_relevant');
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getUserRelevantTasks(),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getTaskById should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getTaskByIdResponse);
        await _GigaTurnipApiClient.getTaskById(anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/$ anyTaskId');
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getTaskById(anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

    group('getIntegratedTasks should', () {

      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getIntegratedTasksResponse);
        await _GigaTurnipApiClient.getIntegratedTasks(anyTaskId);

        mockApi.expectRequestSentTo('/api/v1/tasks/$ get_integrated_tasks');
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _GigaTurnipApiClient.getIntegratedTasks(anyTaskId),
            throwsA(isInstanceOf<UnKnowApiException>()));
      });
    });

  });
}

