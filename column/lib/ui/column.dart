import 'package:flutter/material.dart';

class Coluna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        /*formas de distruir os elementos (widgets) dentro da coluna

        utilizando o mainAxisAlignment "Alinhamento junto ao eixo principal"
        com a seguinte sintaxe:
        mainAxisAlignment: MainAxisAlignment.OtipoDeAlinhamentoDesejado

        podem ser os seguintes:
        .spaceAround  >> elementos organizados com espaço em voltda
        .spaceBetween >> elementos organizados com espaço em volda de si
        .spaceEvenly  >> elementos organizados com espaços iguais entre si
        .center       >>  elementos organizados no centro da culuna (otimo pra telas d login)
        .end          >> elementos organizados ao final da coluna
        .start        >> elementos organizado no inicio da coluna

        */

        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          Text("Primeiro intem da coluna"),
          Text("Segundo item da coluna"),
          Text("terceiro item da coluna",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30.2,
                  fontWeight: FontWeight.w500)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                "Os itens são distribuidos conforme dua declaração no código.",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 33.0,
                )),
          ),
          Icon(
            Icons.developer_board,
            size: 40.2,
            color: Colors.amberAccent,
          ),
          FlatButton(
              onPressed: () {},
              child: Text("Botão", style: TextStyle(fontSize: 30.0)))
        ],
      ),
    );
  }
}
