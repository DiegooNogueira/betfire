import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "imagens/logoBetFire.png",
          width: MediaQuery.of(context).size.width * 0.24,
          height: MediaQuery.of(context).size.height * 0.30,
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      )
    );
  }
}