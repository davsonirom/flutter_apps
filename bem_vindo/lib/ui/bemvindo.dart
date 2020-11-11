import 'package:flutter/material.dart';

class Bemvindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: new Center(
        child: Text(
          "Ola!, Dev:)",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.black,
              fontSize: 134.0,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
