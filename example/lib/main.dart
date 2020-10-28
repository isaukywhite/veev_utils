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
            future: Cep.buscar('01001000'),
            builder: (context, snapshot) {
              return Text(snapshot.data == null ? '' : snapshot.data.bairro);
            },
          ),
          RaisedButton(
            child: Text('Extraindo numeros'),
            onPressed: () {
              String teste = '12aasd912a1';
              print(Extrair().numeros(teste));
            },
          ),
          RaisedButton(
            child: Text('Validando CPF'),
            onPressed: () {
              String cpf = '11111111111';
              print(Cpf().validar(cpf));
            },
          ),
          RaisedButton(
            child: Text('Data para Texto'),
            onPressed: () {
              print(Extrair().dataParaTexto(DateTime.now()));
            },
          ),
          RaisedButton(
            child: Text('Texto para Data'),
            onPressed: () {
              String texto = '01/01/2020';
              print(Extrair().textoParaData(texto));
            },
          ),
          RaisedButton(
            child: Text('Zeros a esquerda'),
            onPressed: () {
              String texto = '1';
              print(Extrair().lpad(texto, 6));
            },
          ),
        ],
      ),
    );
  }
}
