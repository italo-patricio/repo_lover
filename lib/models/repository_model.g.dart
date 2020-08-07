// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepositoryModel on RepositoryModelBase, Store {
  final _$isLovedAtom = Atom(name: 'RepositoryModelBase.isLoved');

  @override
  bool get isLoved {
    _$isLovedAtom.reportRead();
    return super.isLoved;
  }

  @override
  set isLoved(bool value) {
    _$isLovedAtom.reportWrite(value, super.isLoved, () {
      super.isLoved = value;
    });
  }

  final _$RepositoryModelBaseActionController =
      ActionController(name: 'RepositoryModelBase');

  @override
  dynamic setIsLoved(bool value) {
    final _$actionInfo = _$RepositoryModelBaseActionController.startAction(
        name: 'RepositoryModelBase.setIsLoved');
    try {
      return super.setIsLoved(value);
    } finally {
      _$RepositoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoved: ${isLoved}
    ''';
  }
}
