import 'package:mobx/mobx.dart';
import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/models/search_result_model.dart';
import 'package:repo_lover/services/api_github_service.dart';

class SearchStore {
  final _apiGithubService = ApiGithubService();

  SearchStore() {
      search = Action(_search);
      addItemLoved = Action(_addItemLoved);
      removeItemLoved = Action(_removeItemLoved);
      setIsLoading = Action(_setIsLoading);
  }

  final _searchResultModel = Observable(SearchResultModel());
  SearchResultModel get searchResultModel => _searchResultModel.value;

  set searchResultModel(SearchResultModel newValue) => _searchResultModel.value = newValue;

  final _isLoading = Observable(false);
  bool get isLoading => _isLoading.value;
  
  Action setIsLoading;
  _setIsLoading(bool newValue) => _isLoading.value = newValue;
  
  final _itemsLoved = Observable(<RepositoryModel>[].toSet());
  
  Set<RepositoryModel> get itemsLoved => _itemsLoved.value;

  Action addItemLoved;
  Action removeItemLoved;

  _addItemLoved(RepositoryModel item) => _itemsLoved.value.add(item);
  _removeItemLoved(RepositoryModel item) => _itemsLoved.value.remove(item);


 Action search;

  _search(String term) async {
    _isLoading.value = true;
    final _result = await _apiGithubService.searchRepo(term);
    
    _searchResultModel.value = _result;
    _isLoading.value = false;
  }

  isLoved(item) {
    return _itemsLoved.value.contains(item);
  }
}
