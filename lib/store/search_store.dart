import 'package:mobx/mobx.dart';
import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/models/search_result_model.dart';
import 'package:repo_lover/services/api_github_service.dart';

import '../models/repository_model.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  final ApiGithubService _apiGithubService;

  @observable
  SearchResultModel searchResultModel;

  @observable
  bool isLoading = false;

  @observable
  ObservableSet<RepositoryModel> itemsLoved =
      ObservableSet.of(<RepositoryModel>[]);

  SearchStoreBase(this._apiGithubService);

  @action
  addItemLoved(RepositoryModel item) {
    item.setIsLoved(true);
    itemsLoved.add(item);
  }

  @action
  removeItemLoved(RepositoryModel item) {
    item.setIsLoved(false);
    itemsLoved.remove(item);
  }

  @action
  Future<void> search(String term) async {
    if (term.isEmpty) {
      return;
    }
    try{
      isLoading = true;
      searchResultModel = await _apiGithubService.searchRepo(term);
      searchResultModel.items.forEach((e) {
        if(isLoved(e)){
          e.setIsLoved(true);
        }
      });

    } catch(e) {
      print(e);
    } finally{
      isLoading = false;
    }
  }

  isLoved(item) {
    if (itemsLoved.isEmpty) return false;

    return itemsLoved.contains(item);
  }
}
