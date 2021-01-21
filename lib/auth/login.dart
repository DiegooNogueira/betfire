//Imports
import 'package:betfire/auth/functionsAuth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//Telas
import 'package:betfire/auth/cadastro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //instanciando classe de funcoes com o bd
  FunctionsAuth functionsAuth = FunctionsAuth();
  var _form = GlobalKey<FormState>();

  //Controladores
  TextEditingController controladorEmail = TextEditingController();
  TextEditingController controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      body: SingleChildScrollView(
          child: Column(
        children: [
          
          SizedBox(
                    height: MediaQuery.of(context).size.height * 0.032,
                  ),
                  //Allinhamento da Imagem
          Center(
            child: Image.asset(
              "imagens/logoBetFire.png",
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),

          //Texto Informativo na Parte Superior da Tela
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                'Faça o Login ou se Cadastre',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.032,
                ),
              )),

          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Form(
              key: _form,
              //Coluna com os Inputs: Email e senha
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Borda dos Inputs
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      color: Colors.white,

                      //Chamando Classe dos Inputs
                      child: formulario(
                          TextInputType.emailAddress,
                          "Digite seu email",
                          false,
                          Icon(
                            Icons.email,
                            color: Colors.orange[800],
                          ),
                          false,
                          controladorEmail),
                    ),
                  ),

                  //Espaçamento entre os Inputs
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.032,
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      color: Colors.white,
                      child: formulario(
                          TextInputType.emailAddress,
                          "Digite sua Senha",
                          true,
                          Icon(
                            Icons.vpn_key,
                            color: Colors.orange[800],
                          ),
                          true,
                          controladorSenha),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //FrontEnd Esqueceu Senha
          Container(
            padding: EdgeInsets.only(top: 5.0),
            alignment: Alignment.centerRight,
            child: FlatButton(
                child: Text(
                  "Esqueceu a Senha",
                  style: TextStyle(
                      color: Colors.blueAccent, fontFamily: "Noto Sans JP"),
                ),
                onPressed: () {}),
          ),

          //Espaçamento para Botões
          Divider(
            height: MediaQuery.of(context).size.height * 0.035,
          ),

          //Container do Botão Login
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.07,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.yellow,
              textColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              //chamando funcao de login
              onPressed: () async => await functionsAuth.loginEmailSenha(
                  email: controladorEmail.text,
                  senha: controladorSenha.text,
                  context: context),
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.07,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.yellow,
              textColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Cadastro(),
                        type: PageTransitionType.rightToLeft));
              },
              child: Text(
                "Cadastro".toUpperCase(),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  //Classe dos inputs
  Widget formulario(
      TextInputType keyBoardType,
      String hintText,
      bool obscureText,
      Icon prefixIcon,
      bool suffixIcon,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          fillColor: Colors.white,
          focusColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.orange[800],
                  ),
                  onPressed: () {
                    print('entrada 1:$obscureText');

                    setState(() {
                      obscureText = !obscureText;
                    });
                    print('saida:$obscureText');
                  })
              : null,
          contentPadding: EdgeInsets.all(20),
          hoverColor: Colors.white),
    );
  }
}
