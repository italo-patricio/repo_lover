import 'dart:convert' as converter;

import 'package:http/http.dart' as http;
import 'package:repo_lover/models/search_result_model.dart';

class ApiGithubService {
  final String _urlApiGithub = 'https://api.github.com';

  ApiGithubService();

  Future searchRepo(term) async {
    var response = await http.get(Uri.parse('$_urlApiGithub/search/repositories?q=$term'));
    if (response.statusCode == 200) {
        return SearchResultModel.fromJson(converter.jsonDecode(response.body));
        
      } else {
        throw Exception('O servidor respondeu com falha de status ${response.statusCode}');
      }
  }

}