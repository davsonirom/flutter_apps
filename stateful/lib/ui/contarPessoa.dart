import 'package:flutter/material.dart';

class ContaGente extends StatefulWidget {
  @override
  _ContaGenteState createState() => _ContaGenteState();
}

class _ContaGenteState extends State<ContaGente> {
  int _totalPessoa = 0;

  void _reset() {
    setState(() {
      _totalPessoa = 0;
    });
  }

  void _contar() {
    setState(() {
      _totalPessoa += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador", style: TextStyle(fontWeight: FontWeight.w500)),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text("Numero de Pessoas",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _totalPessoa <= 1
                    ? Icon(
                        Icons.person,
                        size: 120.0,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.group,
                        size: 120.0,
                        color: Colors.white,
                      ),
                Text("$_totalPessoa",
                    style: TextStyle(
                        fontSize: 110.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: _reset,
                    backgroundColor: Colors.white60,
                    child: Icon(
                      Icons.refresh,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              minWidth: 200.0,
              height: 80.0,
              splashColor: Colors.grey,
              onPressed: _contar,
              color: Colors.white,
              child: Text("+ um",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0)),
            )
          ]),
    );
  }
}
