import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.buttonName,
    @required this.icon,
  }) : super(key: key);

  final String buttonName;
  final IconData icon;

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
      child: RaisedButton.icon(
        onPressed: () {},
        color: Colors.yellow,
        icon: Icon(
          icon,
          size: 20,
          color: Colors.blue,
        ),
        label: Text(
          buttonName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
