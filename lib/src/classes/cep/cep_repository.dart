import 'cep_class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CepRepository {
  Future<CepClass> getViaCep(String cep) async {
    var response = await http.get('https://viacep.com.br/ws/$cep/json/');
    return CepClass.fromJson(json.decode(response.body));
  }
}
