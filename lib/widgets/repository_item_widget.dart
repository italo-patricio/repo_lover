import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:repo_lover/models/repository_model.dart';

class RepositoryItemWidget extends StatefulWidget {
  final bool isLoved;
  final Function(RepositoryModel) onLoveAdd;
  final Function(RepositoryModel) onLoveRemove;
  final RepositoryModel item;

  const RepositoryItemWidget({Key key, this.isLoved, this.onLoveAdd, this.onLoveRemove, this.item}) : super(key: key);

  @override
  _RepositoryItemWidgetState createState() => _RepositoryItemWidgetState(item, isLoved, onLoveAdd, onLoveRemove);
}

class _RepositoryItemWidgetState extends State<RepositoryItemWidget> {
  final bool isLoved;
  final Function(RepositoryModel) onLoveAdd;
  final Function(RepositoryModel) onLoveRemove;

   _RepositoryItemWidgetState(
    @required RepositoryModel item,
    this.isLoved,
    this.onLoveAdd,
    this.onLoveRemove,
  )  : _item = item;

  final RepositoryModel _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _item.avatarUrl != null
            ? Image.network(_item.avatarUrl)
            : Icon(Icons.info),
        title: Text('${_item.title}'),
        subtitle: Text(
          '${_item.description}',
          maxLines: 3,
        ),
        trailing: isLoved ? showButtonLoveRemove(_item) : showButtonLoveAdd(_item),
      ),
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
