//Imports
import 'package:flutter/material.dart';

class Conta extends StatefulWidget {
  @override
  _ContaState createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          //Imagem central no appBar
          title: Image.asset("imagens/logoBetFire.png",
              width: MediaQuery.of(context).size.width * 0.24, height: 48),
          centerTitle: true,
          backgroundColor: Colors.orange[700],
        ),
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),

        //coluna com a imagem e informações do usuario
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000.0),
              child: Image.asset(
                "imagens/logoBetFire.png",
                width: 300,
                height: 300,
              ),
            ),
            ListTile(
              title: Text('diego'),
              subtitle: Text("Nome:"),
            ),
            ListTile(
              title: Text(
                'diego@gmail.com',
              ),
              subtitle: Text("Email"),
            ),
          ],
        ),
      ),
    ));
  }
}
