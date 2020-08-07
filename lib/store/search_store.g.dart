// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on SearchStoreBase, Store {
  final _$searchResultModelAtom =
      Atom(name: 'SearchStoreBase.searchResultModel');

  @override
  Observable<SearchResultModel> get searchResultModel {
    _$searchResultModelAtom.reportRead();
    return super.searchResultModel;
  }

  @override
  set searchResultModel(Observable<SearchResultModel> value) {
    _$searchResultModelAtom.reportWrite(value, super.searchResultModel, () {
      super.searchResultModel = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'SearchStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$itemsLovedAtom = Atom(name: 'SearchStoreBase.itemsLoved');

  @override
  ObservableSet<RepositoryModel> get itemsLoved {
    _$itemsLovedAtom.reportRead();
    return super.itemsLoved;
  }

  @override
  set itemsLoved(ObservableSet<RepositoryModel> value) {
    _$itemsLovedAtom.reportWrite(value, super.itemsLoved, () {
      super.itemsLoved = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('SearchStoreBase.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$SearchStoreBaseActionController =
      ActionController(name: 'SearchStoreBase');

  @override
  dynamic addItemLoved(RepositoryModel item) {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.addItemLoved');
    try {
      return super.addItemLoved(item);
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItemLoved(RepositoryModel item) {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.removeItemLoved');
    try {
      return super.removeItemLoved(item);
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchResultModel: ${searchResultModel},
isLoading: ${isLoading},
itemsLoved: ${itemsLoved}
    ''';
  }
}
