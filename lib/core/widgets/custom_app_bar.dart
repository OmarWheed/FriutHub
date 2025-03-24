import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new)),
    title: Text(title),
  );
}
