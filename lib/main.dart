import 'dart:ffi';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool _botaoHabilitado = false;

  String _infoText = 'Informe os dados';

  void _resetFields(){
    weigetController.text = '';
    heigetController.text = '';
    setState(() {
    _infoText = 'Informe os dados';
    });
  }

  void _calcular (){
    setState(() {
      _botaoHabilitado = weigetController.text.isNotEmpty && heigetController.text.isNotEmpty;
      double weight = double.parse(weigetController.text);
      double height = double.parse(heigetController.text);
      double imc = weight / (height * weight);

      if(imc < 18.6){
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)}";
      }else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal (${imc.toStringAsPrecision(4)}";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)}";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade grau I (${imc.toStringAsPrecision(4)}";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade grau II (${imc.toStringAsPrecision(4)}";
      }else if(imc >= 40.0){
        _infoText = "Obesidade grau III (${imc.toStringAsPrecision(4)}";
      }
    });
  }

  @override
  void dispose() {
    weigetController.dispose();
    heigetController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
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
          const Icon(Icons.person_outline_sharp, size: 140.0,
          color: Colors.blue),
          TextField(keyboardType: TextInputType.number, 
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: const InputDecoration(
            labelText: 'Peso(kg)',                           
            labelStyle: TextStyle(color: Colors.blue)
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.blue, fontSize: 25.0),
            controller: weigetController,
          ),


          TextField(keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            labelText: 'Altura(cm)',
            labelStyle: TextStyle(color: Colors.blue)
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.blue, fontSize: 22.0),
          controller: heigetController,
          ),


         Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
         child: Container(
            height: 40.0,
            child: ElevatedButton(
              onPressed: _botaoHabilitado ? _calcular: null,
                      
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue),
              child: const Text('Calcular', style: TextStyle(
                color: Colors.white,
                fontSize: 25.0),

                
              ),
            ),
          ),
         ),
          Text(_infoText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 22.0),),
        ],
      ),
      ),
    );
  }
}

