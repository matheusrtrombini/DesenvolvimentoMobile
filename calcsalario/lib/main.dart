import 'package:calcsalario/segundatela.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
      theme:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.lightGreenAccent),
      title: " Calculo Salario",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final qtdHoras = TextEditingController();
  final salHora = TextEditingController();
  final totDependentes = TextEditingController();
  double salarioBruto = 0.0;
  double descontoInss = 0.0;
  double descontoIR = 0.0;
  double salarioLiquido = 0.0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Cálculo de Salário", style: TextStyle( color: Colors.black)),
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
                  TextField(
                    controller: qtdHoras,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.0)),
                            gapPadding: 01.0,
                            borderSide: BorderSide()
                        ),
                        labelText: "Quantidade de Horas",
                        labelStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: salHora,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.0)),
                            gapPadding: 01.0,
                            borderSide: BorderSide()
                        ),
                        labelText: "Salário Hora",
                        labelStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: totDependentes,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.0)),
                            gapPadding: 01.0,
                            borderSide: BorderSide()
                        ),
                        labelText: "Total Dependentes",
                        labelStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          pegaValor();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resultado(
                                    salarioBruto: salarioBruto,
                                    descontoInss: descontoInss,
                                    descontoIR: descontoIR,
                                    salarioLiquido: salarioLiquido,
                                  )
                              )
                          );

                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.lightGreenAccent;
                            return Colors.lightGreenAccent; // Use the component's default.
                          },
                        ),
                      ),
                      child: Text(
                        'Calcular', style: TextStyle(color: Colors.black),
                      )
                  ),
                ],
              ),
            )
        )
    );
  }
  void pegaValor() {
    salarioBruto = double.parse(qtdHoras.text) * double.parse(salHora.text) +
        (50 * double.parse(totDependentes.text));
    if (salarioBruto <= 1000) {
      descontoInss = salarioBruto * 8.5 / 100;
    }
    else {
      descontoInss = salarioBruto * 9 / 100;
    }
    if (salarioBruto <= 500) {
      descontoIR = 0;
    }
    else if (salarioBruto > 500 && salarioBruto <= 1000) {
      descontoIR = salarioBruto * 5 / 100;
    }
    else {
      descontoIR = salarioBruto * 7 / 100;
    }
    salarioLiquido = salarioBruto - descontoInss - descontoIR;
  }
}