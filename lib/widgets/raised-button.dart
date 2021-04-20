import 'dart:ui';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.buttonName,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final IconData icon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.8,
      /*decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.blue,
      ),*/
      // ignore: deprecated_member_use
      child: RaisedButton.icon(
        onPressed: () {},
        color: Colors.greenAccent,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.blue,
        ),
        label: Text(
          buttonName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
