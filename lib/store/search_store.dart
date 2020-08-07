import 'package:mobx/mobx.dart';
import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/models/search_result_model.dart';
import 'package:repo_lover/services/api_github_service.dart';

import '../models/repository_model.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  final _apiGithubService = ApiGithubService();

  @observable
  Observable<SearchResultModel> searchResultModel = Observable(null);

  @observable
  bool isLoading = false;

  @observable
  ObservableSet<RepositoryModel> itemsLoved =
      ObservableSet.of(<RepositoryModel>[]);

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
    isLoading = true;
    searchResultModel.value = await _apiGithubService.searchRepo(term);
    searchResultModel.value.items.forEach((e) async {
      if (isLoved(e)) {
        await e.setIsLoved(true);
      }
    });
    isLoading = false;
  }

  isLoved(item) {
    return itemsLoved.firstWhere(item)?.id != null;
  }
}
