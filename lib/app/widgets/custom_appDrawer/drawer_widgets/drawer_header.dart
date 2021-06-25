import 'package:flutter/material.dart';

Widget createHeader() {
  return DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage('images/App name.jpg'))), child: null,
            );

}
