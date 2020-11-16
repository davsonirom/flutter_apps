import 'package:flutter/material.dart';

class PlanetaX extends StatefulWidget {
  _PlanetaXState createState() => _PlanetaXState();
}

class _PlanetaXState extends State<PlanetaX> {
  final TextEditingController _pesoController = TextEditingController();
  int valorRadio;
  double mass = 0;
  String _resultadoFinal = "";
  double _font = 20.0;
  void tomaContaDoValorRadio(int valor) {
    switch (valor) {
      case 0:
        mass = 0.16;
        break;
      case 1:
        mass = 0.38;
        break;
      case 2:
        mass = 0.91;
        break;
      case 4:
        mass = 0.38;
        break;
      case 5:
        mass = 2.34;
        break;
      case 6:
        mass = 1.06;
        break;
      case 7:
        mass = 0.92;
        break;
      case 8:
        mass = 1.92;
        break;
      case 9:
        mass = 0.06;
        break;
      default:
        mass = 0;
    }

    String calcularPeso(String peso, double mass) {
      if (int.parse(peso).toString().isNotEmpty &&
          int.parse(peso) > 0 &&
          int.parse(peso) != null) {
        return ((int.parse(peso)) * mass).toStringAsFixed(1);
      }
    }

    setState(() {
      _resultadoFinal = calcularPeso(_pesoController.text, mass);
      print(_resultadoFinal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Planeta X",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              color: Colors.black38,
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                TextField(
                  controller: _pesoController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "Seu peso terraquio",
                      hintText: "Kg"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      // activeColor: Colors.white,
                      value: 0,
                      groupValue: valorRadio,
                      onChanged: tomaContaDoValorRadio,
                    ),
                    Text(
                      "Lua",
                      style: TextStyle(color: Colors.white, fontSize: _font),
                    ),
                    Radio<int>(
                      activeColor: Colors.brown.shade400,
                      value: 1,
                      groupValue: valorRadio,
                      onChanged: tomaContaDoValorRadio,
                    ),
                    Text(
                      "Mercurio",
                      style: TextStyle(
                          color: Colors.brown.shade400, fontSize: _font),
                    ),
                    Radio<int>(
                      activeColor: Colors.brown.shade300,
                      value: 2,
                      groupValue: valorRadio,
                      onChanged: tomaContaDoValorRadio,
                    ),
                    Text(
                      "Vênus",
                      style: TextStyle(
                          color: Colors.brown.shade300, fontSize: _font),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 4,
                        groupValue: valorRadio,
                        onChanged: tomaContaDoValorRadio,
                      ),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.red, fontSize: _font),
                      ),
                      Radio<int>(
                        activeColor: Colors.redAccent,
                        value: 5,
                        groupValue: valorRadio,
                        onChanged: tomaContaDoValorRadio,
                      ),
                      Text(
                        "Júpter",
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: _font),
                      ),
                      Radio<int>(
                        activeColor: Colors.green,
                        value: 6,
                        groupValue: valorRadio,
                        onChanged: tomaContaDoValorRadio,
                      ),
                      Text(
                        "Saturno",
                        style: TextStyle(
                            color: Colors.greenAccent, fontSize: _font),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.green.shade200,
                        value: 7,
                        groupValue: valorRadio,
                        onChanged: tomaContaDoValorRadio,
                      ),
                      Text(
                        "Urano",
                        style: TextStyle(
                            color: Colors.green.shade200, fontSize: _font),
                      ),
                      Radio<int>(
                        activeColor: Colors.blueAccent,
                        value: 8,
                        groupValue: valorRadio,
                        onChanged: tomaContaDoValorRadio,
                      ),
                      Text(
                        "Neturno",
                        style: TextStyle(
                            color: Colors.blueAccent, fontSize: _font),
                      ),
                      Radio<int>(
                        activeColor: Colors.grey,
                        value: 9,
                        groupValue: valorRadio,
                        onChanged: tomaContaDoValorRadio,
                      ),
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.grey, fontSize: _font),
                      ),
                    ]),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Card(
                elevation: 8.0,
                child: Center(
                  child: Text("$_resultadoFinal kg",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 80.0,
                        fontWeight: FontWeight.w800,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
