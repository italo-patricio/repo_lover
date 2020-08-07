import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class IconLoveBadgeWidget extends StatelessWidget {
  final int countBadge;

  const IconLoveBadgeWidget({Key key, this.countBadge = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: <Widget>[
      Container(width: 80, height: 50),
      Icon(CommunityMaterialIcons.heart_multiple_outline),
      showBadge(context)
    ]);
  }

  showBadge(context) {
    if (countBadge == 0) {
      return Container();
    }
    String _valueBadge = countBadge > 99 ? '+99' : countBadge.toString();
    double _fontSize = countBadge > 99 ? 10 : 12;
    return Positioned(
      right: 0,
      top: 6,
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$_valueBadge',
            style: TextStyle(
                color: Colors.white, fontSize: _fontSize),
          )),
    );
  }
}
