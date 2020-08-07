import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repo_lover/models/repository_model.dart';
import 'package:repo_lover/models/search_result_model.dart';
import 'package:repo_lover/services/api_github_service.dart';
import 'package:repo_lover/store/search_store.dart';
import 'package:repo_lover/widgets/icon_love_badge_widget.dart';
import 'package:repo_lover/widgets/input_widget.dart';
import 'package:repo_lover/widgets/repository_item_widget.dart';

class RepoLovedPage extends StatefulWidget {
  final SearchStore searchStore;

  const RepoLovedPage({Key key, this.searchStore}) : super(key: key);
  @override
  _RepoLovedPageState createState() => _RepoLovedPageState(searchStore);
}

class _RepoLovedPageState extends State<RepoLovedPage> {

  // SearchResultModel _searchResultModel;
  // bool isLoading = false;
  // Set<RepositoryModel> _itemsLoved = Set.of([]);

  final SearchStore _searchStore;

  _RepoLovedPageState(this._searchStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Repo amados (${_searchStore.itemsLoved.length})',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: _searchStore.searchResultModel?.items?.length ?? 0,
                  itemBuilder: (_, index) {
                    final _item = _searchStore.searchResultModel.items[index];
                    return RepositoryItemWidget(
                      item: _item,
                      isLoved: true,
                      onLoveRemove: (item) => _searchStore.removeItemLoved.call([item]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

}
