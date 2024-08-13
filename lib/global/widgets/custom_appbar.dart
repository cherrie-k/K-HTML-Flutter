import 'package:flutter/material.dart';

AppBar customAppbar({
  required BuildContext context,
  required String title,
  bool showBack = true,
  double height = 56,
}) {
  return AppBar(
    toolbarHeight: height,
    leading: showBack
        ? IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF494949),
            ),
          )
        : null,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: showBack ? true : false,
  );
}
