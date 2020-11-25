import 'package:flutter/material.dart';

class Hoje extends StatelessWidget {
  final String _hoje;
  final String _temperatura;
  final String _status;
  final String _humidade;
  final String _vento;

  // const Hoje({
  //   Key key,
  // }) : super(key: key);

  Hoje(
      this._hoje, this._temperatura, this._status, this._humidade, this._vento);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        alignment: Alignment.topRight,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Hoje $_hoje"),
            Text(
              "$_temperatura˚",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 150.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "$_status",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.bottomRight,
              child: Column(
                children: [Text("Humidade ${_humidade}% \nVento ${_vento}")],
              ),
            )
          ],
        ),
      ),
    );
  }
}
