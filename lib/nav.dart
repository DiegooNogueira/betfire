//---- Packages
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

//Telas
import 'package:betfire/view/home/principal.dart';
import 'package:betfire/view/home/cenario.dart';
import 'package:betfire/view/infos/desenvolvedores.dart';
import 'package:betfire/view/infos/sobre.dart';
import 'package:betfire/view/user/conta.dart';
import 'package:betfire/view/home/search.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  //Variavel da Tela
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(children: [
            //ListTiles do Drawer == itens do menu lateral
            ListTile(
              title: Text("Conta"),
               leading: Icon(Icons.person),
               onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Conta()),
                      )
                    }
            ),
            ListTile(
                title: Text("Desenvolveres"),
                leading: Icon(Icons.group),
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Desenvolvedores()),
                      )
                    }
                    ),

            ListTile(
                title: Text("Sobre"),
                leading: Icon(Icons.info),
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sobre()),
                      )
                    }),

            ListTile(title: Text("Ajuda"), leading: Icon(Icons.help)),

            ListTile(
              title: Text("Sair"),
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Sair'),
                        content: Text('Você realmente deseja sair?'),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Sim"),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Não"),
                          )
                        ],
                      );
                    }),
              },
              leading: Icon(Icons.exit_to_app),
            ),
          ]),
        ),

        //App Bar prédefinido
        appBar: AppBar(
          title: Image.asset("imagens/logoBetFire.png",
              width: MediaQuery.of(context).size.width * 0.24, height: 48),
          centerTitle: true,
          backgroundColor: Colors.orange[700],
        ),

        //corpo da tela que vai ser alterado pela variavel de tela
        body: _index == 0 ? Principal() : Cenario(),

        floatingActionButton: FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                        child: Search(),
                        type: PageTransitionType.rightToLeft)),
                backgroundColor: Colors.orange[800]),

        //botões que ficam na parte inferioi da tela
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                activeIcon: Icon(Icons.home, color: Colors.orange[800])),
            BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: "Cenário",
                activeIcon: Icon(Icons.article, color: Colors.orange[800])),
          ],
          //ontap que muda o valor da variavel de tela
          onTap: (i) {
            setState(() {
              _index = i;
            });
          },
          currentIndex: _index,
        ));
  }
}
