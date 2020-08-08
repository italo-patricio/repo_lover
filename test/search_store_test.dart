import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/services/api_github_service.dart';

import 'package:repo_lover/store/search_store.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'mock/result_mock.dart';

class HttpClientMock extends Mock implements http.Client {}

void main() {
  ApiGithubService service;
  HttpClientMock client;

  group('Test Store', () {
    setUpAll(() {
      client = HttpClientMock();
      service = ApiGithubService(client);
    });

    test('should update value loading in StoreSearch', () {
      final store = SearchStore(service);
      store.isLoading = true;
      expect(store.isLoading, true);
    });

    test(
        'should load SearchResultModel with items when term searched is not empty',
        () async {
      final store = SearchStore(service);
      when(client.get('https://api.github.com/search/repositories?q=flutter'))
          .thenAnswer((_) async => http.Response(
                  jsonEncode(resultMock).toString(), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));

      await store.search('flutter');
      expect(store.searchResultModel.items, isNotNull);
    });

    test(
        'should load future status reject SearchResultModel.status when term searched is empty',
        () async {
      final store = SearchStore(service);
      when(client.get('https://api.github.com/search/repositories?q='))
          .thenAnswer((_) async => http.Response(
                  jsonEncode(resultMockFail), 422, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));

      await store.search('');
      expect(store.searchResultModel, isNull);
    });

    test('should exists item in list loved ', () async {
      final store = SearchStore(service);
      when(client.get('https://api.github.com/search/repositories?q=flutter'))
          .thenAnswer((_) async => http.Response(
                  jsonEncode(resultMock), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));

      store.addItemLoved(RepositoryModel.fromJson({
        'id': 31792824,
        "name": "flutter",
        "description": "xablauton",
        'owner': {
          'avatar_url': 'https://avatars3.githubusercontent.com/u/14101776?v=4',
        }
      }));

      final disposer = mobx.reaction((_) => store.searchResultModel, (_) {
        print('reaction');
      });

      await store.search('flutter');
      print('after await');
      expect(store.searchResultModel, isNotNull);
      expect(store.isLoved(store.searchResultModel.items.first), true);

      disposer();
    });
    test('should remove item in list loved case exists', () async {
      final store = SearchStore(service);
      when(client.get('https://api.github.com/search/repositories?q=flutter'))
          .thenAnswer((_) async => http.Response(
                  jsonEncode(resultMock), 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));
      store.addItemLoved(RepositoryModel.fromJson({
        'id': 31792824,
        "name": "flutter",
        "description": "xablauton",
        'owner': {
          'avatar_url': 'https://avatars3.githubusercontent.com/u/14101776?v=4',
        }
      }));
      store.addItemLoved(RepositoryModel.fromJson({
        'id': 31792825,
        "name": "flutter2",
        "description": "xablauton2",
        'owner': {
          'avatar_url': 'https://avatars3.githubusercontent.com/u/14101776?v=4',
        }
      }));
      store.addItemLoved(RepositoryModel.fromJson({
        'id': 317928246,
        "name": "flutter3",
        "description": "xablauton",
        'owner': {
          'avatar_url': 'https://avatars3.githubusercontent.com/u/14101776?v=4',
        }
      }));

      final itemToRemove = RepositoryModel.fromJson({
        'id': 31792825,
        "name": "flutter2",
        "description": "xablauton2",
        'owner': {
          'avatar_url': 'https://avatars3.githubusercontent.com/u/14101776?v=4',
        }
      });

      store.removeItemLoved(itemToRemove);
      store.removeItemLoved(itemToRemove);
      expect(store.itemsLoved.length, 2);

      expect(store.itemsLoved.contains(itemToRemove), false);
    });
  });
}
