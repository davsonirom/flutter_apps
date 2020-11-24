import 'package:flutter/material.dart';

class boby_logo extends StatelessWidget {
  const boby_logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      height: 200,
      child: Image.asset(
        "assets/logo.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
