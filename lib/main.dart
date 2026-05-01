

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 136, 243),
        actions: <Widget>[
          IconButton(onPressed: () {}, 
          icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
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
            style: TextStyle(color: Colors.blue, fontSize: 25.0
            ),
          ),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Altura(cm)',
            labelStyle: TextStyle(color: Colors.blue)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 25.0
          ),
          ),
        ],
      ),
    );
  }
}