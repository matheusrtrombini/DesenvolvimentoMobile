import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.grey),
      title: "Escolha o Combustível",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String escolheCombustivel(double calculoGasEt) {
  if (calculoGasEt < 0.7) {
    return "Etanol!";
  } else {
    return "Gasolina!";
  }
}

class _HomeState extends State<Home> {
  final valorGasolina = TextEditingController();
  final valorEtanol = TextEditingController();
  double gasolina = 0.0;
  double etanol = 0.0;
  double calculoGasEt = 0.0;
  String resultado = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Escolha o Combustível!!", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://thumbs.jusbr.com/imgs.jusbr.com/publications/images/559e7777eeaaff28ddafd1aec86b8283'),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: valorGasolina,
                    keyboardType:
                    TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            gapPadding: 01.0,
                            borderSide: BorderSide()),
                        labelText: "Gasolina"),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    controller: valorEtanol,
                    keyboardType:
                    TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            gapPadding: 01.0,
                            borderSide: BorderSide()),
                        labelText: "Etanol"),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final double valorGasol =
                          double.parse(valorGasolina.text);
                          final double valorEtan =
                          double.parse(valorEtanol.text);
                          calculoGasEt = valorEtan / valorGasol;
                          resultado = escolheCombustivel(calculoGasEt);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.green;
                            return Colors.grey; // Use the component's default.
                          },
                        ),
                      ),
                      child: Text(
                        'Enviar', style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text("$resultado",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            )
        )
    );
  }
}