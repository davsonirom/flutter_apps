import 'package:flutter/material.dart';

class Linha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        /* 
        assim com na coluna pode ser feito o alinhamento dos elementos dentro da linha
        contudo aqui tem um diferença.
        Na coluna o mainAxisAlignment (alinhamento no eixo pricipal) dar efeito no eixo Y 'Vertical'
        enquanto que na linha o mainAxisAlignment (alinhamento no eixo principal) dar efeito
        no eixo x 'Horizontal'

        um segundo eixo pode ser utilizado para realizar o alinhamento no eixo cruzado
        e tem comportamento diferente, estando aplicado a linha ou coluna, sendo sempre
        o oposto do alinhado um do outro.
        Este alinhamento é realizado pelo crossAxisAlignment (alinhamento do eixo cruzado)

        column (coluna):

              Y -> mainAxisAlignment
              |
              |
      --------|--------- X -> crossAxisAlignment
              |
              |

        Row (linha):

              Y -> crossAxisAlignment
              |
              |
      --------|--------- X -> mainAxisAlignment
              |
              |
              
      Dos alinhamento no eixo cruzado
      .center     >> Elementos alinhados no centro da tela
      .baseline   >> Elementos alinhados no topo da tela
      .end        >> Elementos alinhados no final da tela
      .start      >> Elementos alinhados no inicio da tela (na borda superior)
      .stretch    >> Elementos alinhados com o comprimento total da tela ( um botao com altura da tela)

      *** tela ou da linha.

        */
        crossAxisAlignment: CrossAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        // crossAxisAlignment: CrossAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Primeiro elemento"),
          Icon(
            Icons.access_alarm_outlined,
            size: 30.1,
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Botão"),
          ),
          Text("Quarto elemento"),
          Icon(
            Icons.home,
            size: 50.0,
          )
        ],
      ),
    );
  }
}
