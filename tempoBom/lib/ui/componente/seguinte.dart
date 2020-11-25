import 'package:flutter/material.dart';

class DiasSeguinte extends StatelessWidget {
  final String _data, _temperatura, _temperaturaMinima, _status;
  // const DiasSeguinte({
  //   Key key,
  // }) : super(key: key);

  DiasSeguinte(
      this._data, this._temperatura, this._temperaturaMinima, this._status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 150,
        padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("$_data"),
            Text(
              "$_temperatura˚ $_temperaturaMinima˚",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$_status"),
                ],
              ),
            ),
            // Image.asset(
            //   'assets/light_rain.png',
            //   height: 70,
            //   width: 70,
            //   fit: BoxFit.cover,
            // ),
          ],
        ),
      ),
    );
  }
}
