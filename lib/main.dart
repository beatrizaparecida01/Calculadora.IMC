import 'dart:ffi';

import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(home: Home(),
    ),
  );
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weigetController = TextEditingController();
  TextEditingController heigetController = TextEditingController();

  String _infoText = 'Informe os dados';

  void _resetFields(){
    weigetController.text = '';
    heigetController.text = '';
    _infoText = 'Informe os dados';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 136, 243),
        actions: <Widget>[
          IconButton( 
          icon: Icon(Icons.refresh),
          onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 175, 209, 236),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline_sharp, size: 140.0,
          color: Colors.blue),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Peso(kg)',                           
            labelStyle: TextStyle(color: Colors.blue)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 25.0),
            controller: weigetController,
          ),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Altura(cm)',
            labelStyle: TextStyle(color: Colors.blue)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 22.0),
          controller: heigetController,
          ),
         Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
         child: Container(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue),
              child: Text('Calcular', style: TextStyle(
                color: Colors.white,
                fontSize: 25.0),
              ),
            ),
          ),
         ),
          Text('Informe os dados',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 22.0),),
        ],
      ),
      ),
    );
  }
}
