// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchResultModel on SearchResultModelBase, Store {
  final _$totalCountAtom = Atom(name: 'SearchResultModelBase.totalCount');

  @override
  int get totalCount {
    _$totalCountAtom.reportRead();
    return super.totalCount;
  }

  @override
  set totalCount(int value) {
    _$totalCountAtom.reportWrite(value, super.totalCount, () {
      super.totalCount = value;
    });
  }

  final _$itemsAtom = Atom(name: 'SearchResultModelBase.items');

  @override
  ObservableList<RepositoryModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<RepositoryModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  @override
  String toString() {
    return '''
totalCount: ${totalCount},
items: ${items}
    ''';
  }
}
