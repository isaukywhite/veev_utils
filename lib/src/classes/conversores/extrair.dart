/// Classe para Funções referentes a Extração e conversão de dados
class Extrair {
  ///Retorna apenas os numeros de uma string
  numeros(String texto) {
    if (texto == null) {
      return null;
    }

    ///retorno da funcao
    String _resposta = '';

    ///lista que recebe o texto dividindo cada letra
    List<String> _textoSplit = texto.split('');
    for (String letra in _textoSplit) {
      if (_isNumeric(letra)) {
        _resposta += letra;
      }
    }
    return _resposta;
  }

  /// Retorna se o letra informada para a função é um numero
  bool _isNumeric(String letra) {
    if (letra == null) {
      return false;
    }
    return double.parse(letra, (e) => null) != null;
  }

  ///Adiciona zeros a esquerda de uma String
  String lpad(String texto, int qtd) {
    ///quantidade de zeros para adicionar na string
    int zeros = qtd - texto.length;
    if (zeros < 0) {
      zeros = 0;
    }

    ///String com os dados da resposta
    String resposta = '';

    ///Para cada zero adiciona um zero no inicio da String
    for (int i = 0; i < zeros; i++) {
      resposta += '0';
    }

    ///Pega a string com os zeros e coloca o texto principal
    resposta += texto;
    return resposta;
  }

  ///Tresnforma DateTime em String formatada
  ///
  ///Informa DateTime retorna '01/01/2020'
  String dataParaTexto(DateTime data) {
    if (data == null) {
      return '';
    }

    ///dia do DateTime
    String dia = lpad('${data.day}', 2);

    ///mes do DateTime
    String mes = lpad('${data.month}', 2);

    ///ano do DateTime
    String ano = lpad('${data.year}', 4);
    return '$dia/$mes/$ano';
  }

  ///Transforma String formatada em DateTime
  ///
  ///Informa '01/01/2020' retorna DateTime referente
  DateTime textoParaData(String texto) {
    if (texto == null) {
      return null;
    }
    try {
      ///Separa o texto dividindo pelas '/'
      List tDiv = texto.split('/');
      DateTime data = DateTime(
        int.parse(tDiv[2]),
        int.parse(tDiv[1]),
        int.parse(tDiv[0]),
      );
      return data;
    } catch (e) {
      return null;
    }
  }
}
