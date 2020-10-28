/// Classe para Funções referentes a numeros dentro da String
class NumerosString {
  ///Retorna apenas os numeros de uma string
  extrairNumeros(String texto) {
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
}
