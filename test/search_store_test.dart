import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:repo_lover/services/api_github_service.dart';

import 'package:repo_lover/store/search_store.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'mock/result_mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  ApiGithubService service;
  MockClient client;

  group('Test Store', () {
    setUpAll(() {
      client = MockClient();
      service = ApiGithubService(client);
    });

    test('should update value loading in StoreSearch', () {
      final store = SearchStore(service);
      final disposer = mobx.reaction((_) => store.isLoading, (_) {
        expect(store.isLoading, true);
      });
      store.isLoading = true;

      disposer();
    });

    test(
        'should load SearchResultModel with items when term searched is not empty',
        () async {
      final store = SearchStore(service);
      when(client.get(Uri.parse(
              'https://api.github.com/search/repositories?q=flutter')))
          .thenAnswer((_) async => http.Response(
                  jsonEncode(resultMock).toString(), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));

      final disposer = mobx.reaction((_) => store.searchResultModel, (_) {
       expect(store.searchResultModel.items, isNotNull);
      });

      await store.search('flutter');

      disposer();
    });

    test(
        'should load future status reject SearchResultModel.status when term searched is empty',
        () async {
      final store = SearchStore(service);
      when(client
              .get(Uri.parse('https://api.github.com/search/repositories?q=')))
          .thenAnswer((_) async => http.Response(
                  jsonEncode(resultMockFail), 422, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));

      final disposer = mobx.reaction((_) => store.searchResultModel, (_) {
        expect(store.searchResultModel.items, isNull);
      });

      await store.search('');

      disposer();
    });
  });
}
