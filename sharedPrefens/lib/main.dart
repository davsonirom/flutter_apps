import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: HomeState(),
  ));
}

class HomeState extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  var campoController = TextEditingController();
  String _dadosSalvos = "";
  @override
  void initState() {
    super.initState();
    _pegaDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shared Preferences",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: campoController,
              decoration: InputDecoration(labelText: 'Digite'),
              cursorColor: Colors.black,
            ),
          ),
          FlatButton(
            color: Colors.black12,
            onPressed: () {
              _salvarDados(campoController.text);
            },
            child: Text("Salvar"),
          ),
          Text("$_dadosSalvos"),
        ],
      ),
    );
  }

  void _pegaDados() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String info = preferences.getString('dados');
    setState(() {
      if (info != null && info.isNotEmpty) {
        _dadosSalvos = info;
      } else {
        _dadosSalvos = "Vazio";
      }
    });
  }

  void _salvarDados(String mensagem) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('dados', mensagem);
  }
}
