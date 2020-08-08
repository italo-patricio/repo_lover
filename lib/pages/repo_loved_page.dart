import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:repo_lover/store/search_store.dart';
import 'package:repo_lover/widgets/repository_item_widget.dart';

class RepoLovedPage extends StatefulWidget {
  final SearchStore searchStore;

  const RepoLovedPage({Key key, this.searchStore}) : super(key: key);
  @override
  _RepoLovedPageState createState() => _RepoLovedPageState(searchStore);
}

class _RepoLovedPageState extends State<RepoLovedPage> {
  final SearchStore _searchStore;

  _RepoLovedPageState(this._searchStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(
            'Repo amados (${_searchStore.itemsLoved.length})',
          );
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(builder: (_) {
                if (_searchStore.itemsLoved.isEmpty) {
                  return Center(
                    child: Text('Nada adicionado a lista de loved'),
                  );
                }
                return ListView.builder(
                    itemCount: _searchStore.itemsLoved?.length ?? 0,
                    itemBuilder: (_, index) {
                      final _item = _searchStore.itemsLoved.elementAt(index);
                      return RepositoryItemWidget(
                        item: _item,
                        onLoveRemove: _searchStore.removeItemLoved,
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
