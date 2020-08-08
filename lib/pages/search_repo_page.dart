import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:repo_lover/pages/repo_loved_page.dart';
import 'package:repo_lover/store/search_store.dart';
import 'package:repo_lover/widgets/icon_love_badge_widget.dart';
import 'package:repo_lover/widgets/input_widget.dart';
import 'package:repo_lover/widgets/repository_item_widget.dart';

class SearchRepoPage extends StatefulWidget {
  final SearchStore searchStore;

  const SearchRepoPage({Key key, this.searchStore}) : super(key: key);
  @override
  _SearchRepoPageState createState() => _SearchRepoPageState(searchStore);
}

class _SearchRepoPageState extends State<SearchRepoPage> {
  final SearchStore _searchStore;

  _SearchRepoPageState(this._searchStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Repo lover',
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Observer(builder: (_) {
            return IconLoveBadgeWidget(
              countBadge: _searchStore.itemsLoved.length,
            );
          }), onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RepoLovedPage(
                          searchStore: _searchStore,
                        )));
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
            children: <Widget>[
              InputWidget(
                placeholder: 'Pesquisar',
                onSubmitted: _searchStore.search,
              ),
              messageInfo(),
              Observer(builder: (_) {
                if (_searchStore.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if(_searchStore.searchResultModel == null) {
                  return Container();
                }
          
                return Expanded(
                  child: ListView.builder(
                      itemCount: _searchStore
                              .searchResultModel.items.length,
                      itemBuilder: (_, index) {
                        final _item =
                            _searchStore.searchResultModel.items[index];

                        return RepositoryItemWidget(
                          item: _item,
                          onLoveAdd: _searchStore.addItemLoved,
                          onLoveRemove: _searchStore.removeItemLoved,
                        );
                      }),
                );
              })
            ],
          )
      ),
    );
  }

  messageInfo() {
    if (_searchStore.searchResultModel?.items != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          '${_searchStore.searchResultModel.totalCount} Repositórios localizados',
          style: GoogleFonts.lato(
            fontSize: 17,
            color: Color(0xff8F8B8B),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Text(
            'Digite algum termo para realizar a pesquisa de repositórios no Github'),
      ),
    );
  }
}
