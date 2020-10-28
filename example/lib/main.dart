import 'package:flutter/material.dart';
import 'package:veev_utils/veev_utils.dart';

void main() {
  runApp(MaterialApp(
    home: ExamplePage(),
  ));
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: CepClass.getCep('01001000'),
            builder: (context, snapshot) {
              return Text(snapshot.data == null ? '' : snapshot.data.bairro);
            },
          ),
          RaisedButton(
            child: Text('Extraindo numeros'),
            onPressed: () {
              String teste = '12aasd912a1';
              print(NumerosString().extrairNumeros(teste));
            },
          ),
          RaisedButton(
            child: Text('Validando CPF'),
            onPressed: () {
              String cpf = '11111111111';
              print(CpfValidatorClass().validar(cpf));
            },
          ),
        ],
      ),
    );
  }
}
