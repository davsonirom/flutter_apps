import 'package:flutter/material.dart';

import 'componente/bg.dart';
import 'componente/dia.dart';
import 'componente/seguinte.dart';

class TempoBom extends StatelessWidget {
  final Map _tempo;
  final List _dias;

  TempoBom(this._tempo, this._dias);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tempo Bão"),
        centerTitle: true,
        elevation: 0,
        // actions: [
        //   IconButton(icon: Icon(Icons.location_city), onPressed: () {}),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          Fundo(),
          Hoje(
              "${_tempo['results']['date']}",
              "${_tempo['results']['temp']}",
              "${_tempo['results']['description']}",
              "${_tempo['results']['humidity']}",
              "${_tempo['results']['wind_speedy']}"),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 4.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DiasSeguinte("${_dias[0]['date']}", "${_dias[0]['max']}",
                    "${_dias[0]['min']}", "${_dias[0]['description']}"),
                DiasSeguinte("${_dias[1]['date']}", "${_dias[1]['max']}",
                    "${_dias[1]['min']}", "${_dias[1]['description']}"),
                DiasSeguinte("${_dias[2]['date']}", "${_dias[2]['max']}",
                    "${_dias[2]['min']}", "${_dias[2]['description']}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
