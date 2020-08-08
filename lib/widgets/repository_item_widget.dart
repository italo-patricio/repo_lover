import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:repo_lover/models/repository_model.dart';

class RepositoryItemWidget extends StatefulWidget {
  final Function(RepositoryModel) onTap;
  final Function(RepositoryModel) onLoveAdd;
  final Function(RepositoryModel) onLoveRemove;
  final RepositoryModel item;

  const RepositoryItemWidget(
      {Key key, this.onLoveAdd, this.onLoveRemove, this.item, this.onTap})
      : super(key: key);

  @override
  _RepositoryItemWidgetState createState() =>
      _RepositoryItemWidgetState(item, onLoveAdd, onLoveRemove, onTap);
}

class _RepositoryItemWidgetState extends State<RepositoryItemWidget> {
  final Function(RepositoryModel) onLoveAdd;
  final Function(RepositoryModel) onLoveRemove;
  final Function(RepositoryModel) onTap;

  _RepositoryItemWidgetState(
    RepositoryModel item,
    this.onLoveAdd,
    this.onLoveRemove,
    this.onTap,
  ) : _item = item;

  final RepositoryModel _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Observer(builder: (_) {
        return ListTile(
          onTap: () => onTap != null ? onTap(_item) : null,
          leading: _item.avatarUrl != null
              ? Image.network(_item.avatarUrl)
              : Icon(Icons.info),
          title: Text('${_item.title}'),
          subtitle: Text(
            '${_item.description}',
            maxLines: 3,
          ),
          trailing: _item.isLoved
              ? showButtonLoveRemove(_item)
              : showButtonLoveAdd(_item),
        );
      }),
    );
  }

  showButtonLoveAdd(item) {
    return IconButton(
        icon: Column(
          children: <Widget>[
            Icon(CommunityMaterialIcons.heart_plus),
          ],
        ),
        onPressed: () => onLoveAdd(item));
  }

  showButtonLoveRemove(item) {
    return IconButton(
        icon: Column(
          children: <Widget>[
            Icon(
              CommunityMaterialIcons.heart_minus,
              color: Color(0xffFA9999),
            ),
          ],
        ),
        onPressed: () => onLoveRemove(item));
  }
}
