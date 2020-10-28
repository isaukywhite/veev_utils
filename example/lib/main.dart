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
      body: Center(
        child: FutureBuilder(
          future: CepClass.getCep('01001000'),
          builder: (context, snapshot) {
            return Text(snapshot.data == null ? '' : snapshot.data.bairro);
          },
        ),
      ),
    );
  }
}
