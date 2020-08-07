import 'dart:convert';

class RepositoryModel {
  int id;
  String title;
  String description;
  String avatarUrl;

  RepositoryModel.fromJson(json) {
      id = json['id'];
      title = json['name'];
      description = json['description'];
      avatarUrl = json['owner']['avatar_url'];
  }
}