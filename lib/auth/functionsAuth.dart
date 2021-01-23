//---- Packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

//API
import 'package:betfire/firebase/api_firebase.dart';

//Telas
import 'package:betfire/nav.dart';
class FunctionsAuth {

  FirebaseAuth auth = FirebaseAuth.instance;
  DocumentSnapshot dataUserr;

  //---- Functions
  Future searchUser() async {
    dataUserr = await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser.uid)
        .get();
  }

  Future<File> getData() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future saveData(
      {String name,
      String email,
      String password,
      FirebaseAuth auth}) async {
    final file = await getData();

    print("Dado do usuário: ${dataUserr.data()}");

    await file.writeAsString(jsonEncode(dataUserr.data()));
  }

  //-------------------------  CADASTRO   ---------------------------------//

  Future cadastroEmailSenha(
      {String email, String senha, String nome, BuildContext context}) async {
    try {
      //criando usuario com email e senha
      await auth.createUserWithEmailAndPassword(email: email, password: senha);

      await dataUser.addUser({          
        "email": email,
        "name": nome,
        "senha": senha,
        "carrousel": 'true',
        'login': 'true',
      });

      await searchUser();

      await saveData();

      User userr = FirebaseAuth.instance.currentUser;

      await userr.sendEmailVerification();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Nav()),
      );

    //Verificando caso tenha algum erro
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        await showDialog(
            context: (context),
            child: AlertDialog(
                content: Text("Essa senha não pertence a esse email"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(
                            context,
                          ),
                      child: Text("Ok"))
                ]));
      } else if (e.code == "email-already-in-use") {
        await showDialog(
            context: (context),
            child: AlertDialog(content: Text("Email já cadastrado"), actions: [
              TextButton(
                  onPressed: () => Navigator.pop(
                        context,
                      ),
                  child: Text("Ok"))
            ]));
      }
    } catch (e) {
      print("Error 'cadastroEmailSenha': $e");
    }
  }

  //-------------------------  LOGIN  ---------------------------------//

  Future loginEmailSenha(
      {String email, String senha, BuildContext context}) async {
    try {
      //logando com email e senha
      await auth.signInWithEmailAndPassword(email: email, password: senha);

      await searchUser();

      await saveData();

      await Navigator.pushAndRemoveUntil(
          context,
          PageTransition(child: Nav(), type: PageTransitionType.bottomToTop),
          (route) => false);
          
      //verificando se caso tenha algum erro
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        await showDialog(
            context: (context),
            child: AlertDialog(content: Text("Email não cadastrado")));
      } else if (e.code == "wrong-password") {
        await showDialog(
            context: (context),
            child: AlertDialog(content: Text("Senha errada")));
      }
    } catch (e) {
      print("Error in FirebaseAuthException on 'loginEmailSenha': $e");
    }
  }
}
