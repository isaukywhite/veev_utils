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
  String lpad(String texto, int decimal) {
    if (texto == null || decimal == null) {
      return null;
    }
    int qtdZeros = decimal - texto.length;
    if (qtdZeros < 0) {
      qtdZeros = 0;
    }
    String zeros = 0.toStringAsFixed(qtdZeros);
    if (zeros == '0') {
      zeros = '';
    } else {
      zeros = zeros.replaceAll('0.', '');
    }
    return '$zeros$texto';
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

  ///Recebe um double e retorna essa valor em formato de dinheiro
  ///
  ///Os parametros são:
  /// - double value  == valor para transformar.
  /// - int decimal == quantos zeros apos a virgula.
  String paraDinheiro(double value, {int decimal}) {
    if (value == null) {
      return null;
    }
    if (decimal == null) {
      decimal = 2;
    }
    return 'R\$${value.toStringAsFixed(decimal).replaceAll('.', ',')}';
  }
}
