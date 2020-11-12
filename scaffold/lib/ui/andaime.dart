import 'package:flutter/material.dart';
import 'package:scaffold/ui/meubotao.dart';

class Andaime extends StatelessWidget {
  void botaoFlutuante() => debugPrint("botao flutuante");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Andaime"),
        backgroundColor: Colors.deepOrange,
        shadowColor: Colors.orangeAccent,
        actions: [
          IconButton(icon: Icon(Icons.print), onPressed: () {}),
          IconButton(icon: Icon(Icons.library_add), onPressed: () {}),
          IconButton(icon: Icon(Icons.headset), onPressed: () {})
        ],
      ),
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Scaffold = Andaime",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700),
            ),
            MeuBotao()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrange,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.pedal_bike), label: "Rota"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp), label: "Tempo"),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup),
            label: "Backup",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: botaoFlutuante,
        child: Icon(
          Icons.save,
          color: Colors.deepOrange,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
