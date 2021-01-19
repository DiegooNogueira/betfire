//Imports
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

//Telas
import 'package:betfire/nav.dart';
class FunctionsAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  //-------------------------  CADASTRO   ---------------------------------//

  Future cadastroEmailSenha(
      {String email, String senha, String nome, BuildContext context}) async {
    try {
      //criando usuario com email e senha
      await auth.createUserWithEmailAndPassword(email: email, password: senha);
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
