import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screen2.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('¡Bienvenido a Baiosen!'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/000/207/700/original/letter_B_typography_RF_RMPL-01.jpg",
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.indigoAccent,
                  child: Text('Olvide mi contraseña'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.indigo,
                      child: Text('Iniciar sesión'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StatsApp()),
                        );
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Crear nueva cuenta?'),
                        FlatButton(
                          textColor: Colors.indigoAccent,
                          child: Text(
                            'Registrate',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                Container(
                    height: 20,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
                    child: IconButton(
                      icon: Icon(Icons.party_mode_outlined),
                      color: Colors.purpleAccent,
                      onPressed: () {launch('https://www.instagram.com/fitness/');},
                    ))
              ],
            )));
  }
}

