
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String placeholder;
  final Function(String) onSubmitted;

  const InputWidget({
    Key key,
    this.placeholder: '',
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: const Color(0xffE5E5E5)),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Color(0xff8F8B8B),
          ),
          SizedBox(width: 5),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xffE5E5E5)),
                  border: InputBorder.none,
                  hintText: placeholder),
              onSubmitted: onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
