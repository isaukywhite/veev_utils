import 'package:veev_utils/src/classes/cep/cep_repository.dart';

///Classe para receber os dados do Cep
class Cep {
  ///Recebe CEP formatado
  final String cep;

  ///Recebe Rua
  final String logradouro;

  ///Recebe Complemento
  final String complemento;

  ///Recebe Bairro
  final String bairro;

  ///Recebe Cidade/Localidade
  final String localidade;

  ///Recebe Estado(UF)
  final String uf;

  ///Recebe numero do IBGE
  final String ibge;

  ///Retorna a gia
  final String gia;

  ///Retorna o ddd utilizado na area
  final String ddd;

  ///sRetorna o siafi
  final String siafi;

  ///Construtor da Classe do Cep
  Cep(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  ///Factory da Classe para transformar Map<String, dynamic> em Cep
  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }

  ///Transforma a Classe em um Map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    data['ddd'] = this.ddd;
    data['siafi'] = this.siafi;
    return data;
  }

  ///Busca os dados passando a String cep informada para o CepRepository
  static Future<Cep> buscar(String cep) async {
    return CepRepository().getViaCep(cep);
  }
}
