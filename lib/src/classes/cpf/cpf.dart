import 'package:veev_utils/src/classes/conversores/extrair.dart';

///Valida Cpf retornando:
/// - true
/// - false
///
/// Basta chamar CpfValidatorClass().validar('11111111111');
///
/// Nao precisa tratar os pontos traços ou espaços,
/// já é feito o tratamento com a classe NumerosString:
/// - NumerosString().extrairNumeros(cpf);
class Cpf {
  ///Funcao para validar
  validar(String cpf) {
    ///Retorna apenas os digitos do CPF
    cpf = Extrair().numeros(cpf);
    if (cpf == null) {
      return false;
    }
    if (cpf.length != 11) {
      return false;
    }

    ///Lista dos digitos do CPF
    List cpfToLista = cpf.split('');

    ///Variavel para fazer a conta de multiplicar os digitos do CPF
    int contaCpf = 0;
    // Para cara digito é feito a multiplicacao dos digitos do CPF
    for (int index = 0; index < cpfToLista.length - 2; index++) {
      int digito = int.parse(cpfToLista[index]);
      contaCpf += digito * (cpfToLista.length - 1 - index);
    }

    ///Resto da divisao dos digitos
    int restoDivisao = contaCpf * 10 % 11;
    contaCpf = 0;

    ///Verifica se os digitos verificadores estao corretos
    if (restoDivisao == int.parse(cpfToLista[9])) {
      for (int index = 0; index < cpfToLista.length - 1; index++) {
        int digito = int.parse(cpfToLista[index]);
        contaCpf += digito * (cpfToLista.length - index);
      }
      restoDivisao = contaCpf * 10 % 11;

      ///Verifica ultimo digito
      if (restoDivisao == int.parse(cpfToLista[10])) {
        return true;
      }
    }
    return false;
  }
}
