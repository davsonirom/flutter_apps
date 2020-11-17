import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  double _altura = 10.1;
  double _peso = 30.0;
  double _imc = 0.0;
  String result = "";
  String resultadoFinal = "Condição";

  void calcular() {
    setState(() {
      _imc = _peso / ((_altura * 2) / 100);
      resultadoFinal = condicao(_imc);
    });
  }

  String condicao(double imc) {
    if (imc < 17) {
      result = "Muito abaixo do peso";
    } else if (imc >= 17 && imc <= 18.49) {
      result = "Abaixo do peso";
    } else if (imc >= 18.50 && imc <= 24.99) {
      result = "Peso normal";
    } else if (imc >= 25 && imc <= 29.99) {
      result = "Acima do peso";
    } else if (imc >= 30 && imc <= 34.99) {
      result = "Obesidade I";
    } else if (imc >= 35 && imc <= 39.99) {
      result = " Obesidade II (severa)";
    } else if (imc >= 40) {
      result = "Obesidade III (mórbida)";
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Índice de massa corporal"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "O índice de massa corporal, conhecido como IMC, é uma técnica utilizada para verificar o estado nutricional e observar se a pessoa está dentro dos padrões de normalidade com relação ao seu peso e estatura.",
              textAlign: TextAlign.justify,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 6.0),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70),
                height: 200.0,
                width: 160.0,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(_altura.toStringAsFixed(1),
                            style: TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Text(
                      "Altura (cm)",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 6.0),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70),
                height: 200.0,
                width: 160.0,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          _peso.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Text(
                      "Peso (kg)",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                // color: Colors.black38,
                child: Slider(
                  activeColor: Colors.black38,
                  inactiveColor: Colors.white70,
                  value: _altura,
                  onChanged: (novaAltura) {
                    setState(() {
                      _altura = novaAltura;
                      calcular();
                    });
                  },
                  min: 10.0,
                  max: 220.0,
                  // divisions: 6,
                  // label: "$_autura",
                ),
              ),
              Container(
                child: Slider(
                  activeColor: Colors.black38,
                  inactiveColor: Colors.white70,
                  value: _peso,
                  onChanged: (novoPeso) {
                    setState(() {
                      _peso = novoPeso;
                      calcular();
                    });
                  },
                  min: 30.0,
                  max: 200,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 20.0,
                color: Colors.white70,
                child: Text(
                  "${_imc.toStringAsFixed(1)}",
                  style:
                      TextStyle(fontSize: 120.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              resultadoFinal,
              style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
