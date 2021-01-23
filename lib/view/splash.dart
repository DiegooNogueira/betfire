
//---- Packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//telas
import 'package:betfire/auth/login.dart';

class Splash extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Splash> {
  @override
  void initState() {
    super.initState();

    //timer com o tempo para chamar a rota
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        route();
      });
      timer.cancel();
    });
  }
  
  //rota de destino depois do timer
  route() {
    Navigator.pushReplacement(context,
        PageTransition(child: Login(), type: PageTransitionType.bottomToTop));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],

      //Imagem na Parte central da tela
      body: Center(
        child: Image.asset(
          "imagens/logoBetFire.png",
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.30,
        ),
      ),
    );
  }
}

