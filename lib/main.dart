//Imports
import 'package:flutter/material.dart';

//Telas
import 'package:betfire/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bet Fire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: "NotoSans"),
      home: Splash(),
    );
  }
}