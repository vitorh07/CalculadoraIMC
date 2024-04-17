//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(appWidget());
}

class appWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          body: HomePage(),
          bottomNavigationBar: creditos(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int peso = 0;
  double altura = 0;
  double imc = 0.0;
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Calculadora de IMC ',
            style:
                TextStyle(color: Colors.amber, decoration: TextDecoration.none),
          ),
          Container(
              child: Column(
            children: <Widget>[
              TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Digite o seu peso em kgs'),
                  onChanged: (value) {
                    peso = int.tryParse(value) ?? 0;
                  }),
              SizedBox(
                height: 20.0,
                width: 40.0,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Digite a sua altura em cm'),
                  onChanged: (value) {
                    altura = double.tryParse(value) ?? 0;
                    altura = altura / 100;
                  }),
              SizedBox(
                height: 20.0,
                width: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imc = peso / (altura * altura);

                        if (imc < 16.9) {
                          text = "Muito abaixo do peso";
                        } else if (imc >= 17 && imc <= 18.4) {
                          text = "Abaixo do peso";
                        } else if (imc >= 18.5 && imc <= 24.9) {
                          text = "Peso normal";
                        } else if (imc >= 25.9 && imc <= 29.9) {
                          text = "Acima do peso";
                        } else if (imc >= 30 && imc <= 34.9) {
                          text = "Obesidade grau I";
                        } else if (imc >= 35 && imc <= 40) {
                          text = "Obesidade grau II";
                        } else if (imc > 40) {
                          text = "Obesidade grau III";
                        }
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          'Calcular',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                ],
              ),
              Text('IMC = ${imc} \n ${text}')
            ],
          ))
        ],
      )),
    );
  }
}

class creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Criadores: \nSamuel Romano \nVitor Fogaça'));
  }
}
