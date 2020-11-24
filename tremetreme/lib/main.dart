import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ui/components/logo.dart';

Future<Map> terremotos() async {
  String url =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falha em obter daddos....');
  }
}

Map _dados;
List _fetures;

void main() async {
  _dados = await terremotos();
  _fetures = _dados['features'];
  runApp(MaterialApp(
    home: TremeTreme(),
  ));
}

class TremeTreme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("TremeTreme"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          boby_logo(),
          Divider(),
          Text("Fonte: https://earthquake.usgs.gov"),
          LIstaTeremotos()
        ],
      ),
    );
  }
}

class LIstaTeremotos extends StatelessWidget {
  const LIstaTeremotos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _fetures.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context, int posicao) {
          initializeDateFormatting('pt_BR', null);
          var format = new DateFormat.yMMMMd("pt_BR").add_jm();
          var data = format.format(DateTime.fromMicrosecondsSinceEpoch(
              _fetures[posicao]['properties']['time'] * 1000));
          return Column(
            children: [
              Divider(
                height: 1.1,
                color: Colors.redAccent,
              ),
              ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Text(
                      "${_fetures[posicao]['properties']['mag']}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text("$data"),
                  subtitle: Text(_fetures[posicao]['properties']['place']),
                  onTap: () {
                    detalhes(
                        context, "${_fetures[posicao]['properties']['title']}");
                  })
            ],
          );
        },
      ),
    );
  }
}

void detalhes(BuildContext context, String mensagem) {
  var alert = AlertDialog(
    title: Text(
      "Detalhes",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.redAccent,
    content: Text(
      mensagem,
      style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
    ),
    actions: [
      FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("OK")),
    ],
  );
  showDialog(context: context, child: alert);
}
