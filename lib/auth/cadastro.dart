//Imports
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  
  //Controladores: Nome, Email, Senha e ConfSenha
  TextEditingController controladorNome = TextEditingController();
  TextEditingController controladorSenha = TextEditingController();
  TextEditingController controladorEmail = TextEditingController();
  TextEditingController controladorConfSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      body: SingleChildScrollView(
          child: Column(
        children: [

          //Imagem na parte superior do Projeto
          Center(
            child: Image.asset(
              "imagens/logoBetFire.png",
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),

          //Texto na parte superior do Projeto
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                'Adicione Suas Informações',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.032,
                ),
              )),

          //Espaçamento da Coluna dos Inputs
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    color: Colors.white,
                    child: formulario(TextInputType.text, "Digite seu Nome",
                        false, null, false, controladorNome),
                  ),
                ),

                //Espaçamento entre os Inputs
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.024,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    color: Colors.white,
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
                  height: MediaQuery.of(context).size.height * 0.024,
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

                //Espaçamento entre os Inputs
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.024,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    color: Colors.white,
                    child: formulario(
                        TextInputType.emailAddress,
                        "Digite sua Senha Novamente",
                        true,
                        Icon(
                          Icons.vpn_key,
                          color: Colors.orange[800],
                        ),
                        true,
                        controladorConfSenha),
                  ),
                ),
              ],
            ),
          ),

          //Espaçamento entre os inputs e o botão
          Divider(
            height: MediaQuery.of(context).size.height * 0.040,
          ),

          //Container do Botão
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
              onPressed: () {},
              child: Text(
                "Cadastrar-se".toUpperCase(),
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

  //Classe dos Inputs
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
