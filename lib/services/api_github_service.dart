import 'dart:convert' as converter;
import 'dart:io';
import 'package:http/http.dart';
import 'package:repo_lover/models/search_result_model.dart';

class ApiGithubService {
  final String _urlApiGithub = 'https://api.github.com';
  Client _http;

  ApiGithubService(this._http);

  Future<SearchResultModel> searchRepo(term) async {
    var response =
        await _http.get('$_urlApiGithub/search/repositories?q=$term', headers:
              {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              });
    if (response.statusCode == 200) {
      return SearchResultModel.fromJson(converter.jsonDecode(response.body));
    } else {
      throw Exception(
          'O servidor respondeu com falha de status ${response.statusCode}');
    }
  }
}
