import 'package:flutter/material.dart';
import 'package:pocket_chef/constants/colors.dart';
import 'package:pocket_chef/constants/dimens.dart';
import 'package:pocket_chef/constants/fonts.dart';

class NameField extends StatelessWidget {
  final TextEditingController textController;

  Key key;

  var hintText;

  NameField({this.textController, this.key, this.hintText}) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparentText,
      margin: const EdgeInsets.all(60.0),
      child: TextField(
        //key: Key('NameFieldContainer'),
        key: key,
        style: TextStyle(
            color: primaryText,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: biggerText),
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            //labelText: 'Name',
            labelText: hintText,
            hintStyle: TextStyle(
                fontSize: hugeText,
                color: primaryText,
                fontFamily: indie,
                fontWeight: FontWeight.w600),
            labelStyle: TextStyle(
                color: primaryText,
                fontFamily: indie,
                fontWeight: FontWeight.w600)),
        controller: textController,
      ),
    );
  }
}
