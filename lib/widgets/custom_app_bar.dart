import 'package:flutter/material.dart';

AppBar buildAppBar(String title,{Widget? leading}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 19),
    ),
    titleSpacing: 0,
    leading: leading,
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
  );
}
