import 'package:flutter/material.dart';
import 'secondScreen.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.deepPurpleAccent,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurpleAccent)),
          hintStyle: TextStyle(color: Colors.deepPurpleAccent),
        )
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valorCotacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Conversor"),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Icon(Icons.add_business_sharp, size: 160.0, color: Colors.deepPurpleAccent),
            Divider(),
            Divider(),
            Divider(),
            Divider(),
            Divider(),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Digite o valor em Reais!",
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: OutlineInputBorder()
                    ),
                    controller: valorCotacao,
                    style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: FlatButton(
                        onPressed: () {
                          String value = valorCotacao.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeSecond(valueReal: value)
                            ),
                          );
                        },
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child:
                          Text("Converter!!", style: TextStyle(
                              fontSize: 25, color: Colors.black),),
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
