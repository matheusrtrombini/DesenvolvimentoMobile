import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
      theme:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.lightGreenAccent),
      title: " Calculo Salario",
      home: Resultado()));
}

class Resultado extends StatefulWidget {
  double salarioBruto = 0.0;
  double descontoInss = 0.0;
  double descontoIR = 0.0;
  double salarioLiquido = 0.0;
  Resultado({this.salarioBruto,this.descontoInss,this.descontoIR,this.salarioLiquido});
  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Resultado", style: TextStyle( color: Colors.black)),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [Image.network('https://www.ideiademarketing.com.br/wp-content/uploads/2018/07/trabalho.jpg'),
                  SizedBox(
                    height: 20.0,
                  ),

                  Text(
                    "Salário Bruto: R\$ "+widget.salarioBruto.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Desconto Inss: R\$ " + widget.descontoInss.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Desconto IR: R\$ " + widget.descontoIR.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Salário Líquido: R\$ " + widget.salarioLiquido.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                  ),

                ],
              ),
            )
        )
    );
  }
}