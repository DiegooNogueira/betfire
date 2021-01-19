//Imports
import 'package:flutter/material.dart';

class Desenvolvedores extends StatefulWidget {
  @override
  _DesenvolvedoresState createState() => _DesenvolvedoresState();
}

class _DesenvolvedoresState extends State<Desenvolvedores> {
  //variavel de estilo de texto
  var textStyle = TextStyle(fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('Desenvolvedores'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Imagem central do projeto
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
          Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(7.0),
              //Linha com os avatares e nomes dos desenvolvedores
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("imagens/logoBetFire.png"),
                          ),
                          Text(
                            "Diego\n"
                            "Técnico em Informática",
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("imagens/logoBetFire.png"),
                          ),
                          Text(
                            "João\n"
                            "Técnico em Informática",
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("imagens/logoBetFire.png"),
                          ),
                          Text(
                            "Maria\n"
                            "Técnico em Informática",
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
