// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_final_fields

import 'package:flutter/material.dart';

class Gasalc extends StatefulWidget {
  const Gasalc({Key? key}) : super(key: key);

  @override
  State<Gasalc> createState() => _GasalcState();
}

class _GasalcState extends State<Gasalc> {
  TextEditingController _controllergas = TextEditingController();
  TextEditingController _controlleralc = TextEditingController();
  String _textoresultado = "";

  void _calcular() {
    double? precoalc = double.tryParse(_controlleralc.text);
    double? precogas = double.tryParse(_controllergas.text);

    if (precoalc == null || precogas == null) {
      setState(() {
        _textoresultado =
            "Valor inválido, digite números acima de 0 e com (.) : ";
      });
    } else {
      if ((precoalc / precogas) >= 0.7) {
        setState(() {
          _textoresultado = "Melhor abastecer com gasolina.";
        });
      } 
      else {
        setState(() {
          _textoresultado = "Melhor abastecer com álcool.";
        });
        _limparcampo();
      }
      ;
    }
  }

  void _limparcampo() {
    _controlleralc.text = "";
    _controllergas.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gasolina ou Álcool"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(35),
              child: Image(image: AssetImage("assets/logo.png")),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Saiba qual a melhor opção para seu veículo"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Digíte o valor da Álcool: ",
                ),
                controller: _controlleralc,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Digíte o valor da Gasolina: ",
                ),
                controller: _controllergas,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child:
                  ElevatedButton(onPressed: _calcular, child: Text("Calcular")),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoresultado,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
