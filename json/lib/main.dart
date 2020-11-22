import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // recebendo do dados da API
  List _dados = await getJson();
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _dados.length,
          padding: const EdgeInsets.all(5.0),
          itemBuilder: (BuildContext context, int posicao) {
            return Column(
              children: <Widget>[
                Divider(height: 1.1),
                ListTile(
                  leading: Text("${_dados[posicao]['id']}"),
                  title: Text("${_dados[posicao]['name']}"),
                  // subtitle: Text("${_dados[posicao]['phone']}"),
                  onTap: () {
                    // debugPrint("${_dados[posicao]['email']}");
                    final String detalhes =
                        "${_dados[posicao]['phone']} \n ${_dados[posicao]['email']}";
                    // _mensagem(context, _dados[posicao]['phone']);
                    _mensagem(context, _dados[posicao]['name'], detalhes);
                  },
                ),
              ],
            );
          },
        ),
      ),
    ),
  ));
}

void _mensagem(BuildContext context, String contato, String mensagem) {
  var alert = AlertDialog(
    backgroundColor: Colors.blue.shade300,
    title: Text(
      contato,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    content: Text(mensagem),
    actions: <Widget>[
      FlatButton(
        onPressed: () => {Navigator.pop(context)},
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white),
        ),
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

// https://jsonplaceholder.typicode.com/users
Future<List> getJson() async {
  String url = 'https://jsonplaceholder.typicode.com/users';
  /*
[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  .......
*/

  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falhou e obter dados! :( ');
  }
}
