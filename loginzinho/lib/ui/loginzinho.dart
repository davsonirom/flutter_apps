import 'package:flutter/material.dart';

class TelinhaLogin extends StatefulWidget {
  @override
  _TelinhaState createState() => _TelinhaState();
}

class _TelinhaState extends State<TelinhaLogin> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70), color: Colors.grey),
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Suas credenciais",
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "arial",
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 30.0,
                      color: Colors.grey.shade200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "Usuário"),
                      ),
                    ),
                    Card(
                      elevation: 20.0,
                      color: Colors.grey.shade200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "Senha"),
                      ),
                    ),
                    RaisedButton(
                      elevation: 25.0,
                      color: Colors.amberAccent.shade200,
                      onPressed: () {},
                      child: Text(
                        "LOGAR",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
