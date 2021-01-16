import 'dart:async';
import 'package:betfire/view/principal.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        route();
      });
      timer.cancel();
    });
  }

  route() {
    Navigator.pushReplacement(context,
        PageTransition(child: Principal(), type: PageTransitionType.bottomToTop));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],
      body: Center(
        child: Image.asset(
          "imagens/hurryCampSplash.png",
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.30,
        ),
      ),
    );
  }
}
