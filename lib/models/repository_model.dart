import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'repository_model.g.dart';

class RepositoryModel = RepositoryModelBase with _$RepositoryModel;

abstract class RepositoryModelBase with Store {
  int id;
  String title;
  String description;
  String avatarUrl;

  @observable
  bool isLoved = false;

  @action
  setIsLoved(bool value) => isLoved = value;

  RepositoryModelBase.fromJson(json) {
    id = json['id'];
    title = json['name'];
    description = json['description'];
    avatarUrl = json['owner']['avatar_url'];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is RepositoryModel && other.id == id && hashCode == other.hashCode;

  @override
  int get hashCode => hashValues(id, title);

}
