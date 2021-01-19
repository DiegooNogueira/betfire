//Imports
import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: Text('Sobre'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Imagem Central
          Center(
            child: Image.asset(
              "imagens/logoBetFire.png",
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.30,
            ),
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.008,
          ),

          //Container que contem a margem do texto
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(7.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  //Texto
                  child: Text(
                    "   BetFire é um app desenvolvido em flutter, e com banco de dados ja incluso, o app se trata de uma plataforma, onde as pessoas poderam anunciar seu torneio/campeonato, ou apenas se inscrever nesse campeonato, o app tambem terá sua aba com informações em tempo real do cenario de free fire. Esse app em si vem com intuito de ajudar jovens, a conseguirem realizar seu sonho de se tornarem pro-players, observando o grande cenário que o free fire conseguiu no Brasil, acho que esse app só vai agregar no cenário.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
