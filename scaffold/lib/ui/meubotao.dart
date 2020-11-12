import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final oii = SnackBar(
          content: Text(
            "Flutter é muito lindinho.",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.orange,
        );
        Scaffold.of(context).showSnackBar(oii);
        debugPrint("botao personalizado clicado");
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          // color: Theme.of(context).accentColor,
          color: Colors.orange,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text("Botão personalizado"),
      ),
    );
  }
}
