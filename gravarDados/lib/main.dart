import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// pegar o diretorio do disco
Future<String> get _caminhoLocal async {
  final diretorio = await getApplicationDocumentsDirectory();
  return diretorio.path; //home/diretorio/.... endereco do disco do aparelgho
}

//criar o arquivo em disco
Future<File> get _arquivoLocal async {
  final caminho = await _caminhoLocal;
  return new File('$caminho/dadosEscritosPeloAppGravarDados.txt');
}

// grava conteudo no arquivo
Future<File> gravarDados(String mensage) async {
  final arquivo = await _arquivoLocal;
  return arquivo.writeAsString('$mensage');
}

// ler dados
Future<String> lerDados() async {
  try {
    final arquivo = await _arquivoLocal;
    // leitura
    String dados = await arquivo.readAsString();
    return dados;
  } catch (e) {
    return "Arquivo em branco";
  }
}

void main() {
  runApp(
    MaterialApp(
      home: HomeState(),
    ),
  );
}

class HomeState extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  var campoDadosController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I/O"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: campoDadosController,
              decoration: InputDecoration(
                labelText: "Digite",
              ),
            ),
            FlatButton(
              onPressed: () {
                gravarDados(campoDadosController.text);
              },
              child: Text("Gravar"),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Divider(),
              FutureBuilder(
                future: lerDados(),
                builder: (BuildContext context, AsyncSnapshot<String> dados) {
                  if (dados.hasData != null) {
                    return Text(
                      dados.data,
                      style: TextStyle(color: Colors.blueGrey),
                    );
                  } else {
                    return Text(
                      "Não encontrado",
                      style: TextStyle(color: Colors.red),
                    );
                  }
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
