import 'package:mobx/mobx.dart';
import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/store/search_store.dart';

part 'search_result_model.g.dart';

class SearchResultModel = SearchResultModelBase with _$SearchResultModel;

abstract class SearchResultModelBase with Store {
  @observable
  int totalCount;

  @observable
  ObservableList<RepositoryModel> items;

  SearchResultModelBase();

  SearchResultModelBase.fromJson(json) {
    totalCount = json['total_count'];
    items = (json['items'] as List)
        .map((item) => RepositoryModel.fromJson(item))
        .toList()
        .asObservable();
  }
}
