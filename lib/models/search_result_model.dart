import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/store/search_store.dart';

class SearchResultModel {
  int totalCount;
  List<RepositoryModel> items;

  SearchResultModel(){
    
  }

  SearchResultModel.fromJson(json) {
    totalCount = json['total_count'];
    items = (json['items'] as List).map((item) => RepositoryModel.fromJson(item)).toList();
  }
}