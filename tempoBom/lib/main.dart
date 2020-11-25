// https://api.hgbrasil.com/weather?woeid=459778

import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'package:http/http.dart' as http;

import 'ui/tempobom.dart';

Future<Map> temperaturaJanauba() async {
  String url = 'https://api.hgbrasil.com/weather?woeid=459778';

  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falha em obter dados');
  }
}

Map _tempoBom;
List _semana;

void main() async {
  _tempoBom = await temperaturaJanauba();
  _semana = _tempoBom['results']['forecast'];
  runApp(MaterialApp(
    home: TempoBom(_tempoBom, _semana),
  ));
}
