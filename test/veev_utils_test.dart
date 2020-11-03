import 'package:flutter_test/flutter_test.dart';
import 'package:veev_utils/veev_utils.dart';

void main() {
  test('Data para String', () {
    final ext = Extrair();
    expect(ext.dataParaTexto(DateTime(2020, 10, 28)), '28/10/2020');
    expect(ext.dataParaTexto(DateTime(2020, 1, 1)), '01/01/2020');
    expect(ext.dataParaTexto(null), '');
  });
  test('String para Data', () {
    final ext = Extrair();
    expect(ext.textoParaData('28/10/2020'), DateTime(2020, 10, 28));
    expect(ext.textoParaData('01/01/2020'), DateTime(2020, 1, 1));
    expect(ext.textoParaData(null), null);
  });

  test('Double para dinheiro', () {
    final ext = Extrair();
    expect(ext.paraDinheiro(2.5), 'R\$2,50');
    expect(ext.paraDinheiro(1), 'R\$1,00');
    expect(ext.paraDinheiro(1, decimal: 3), 'R\$1,000');
    expect(ext.paraDinheiro(null, decimal: 3), null);
    expect(ext.paraDinheiro(1, decimal: null), 'R\$1,00');
    expect(ext.paraDinheiro(null, decimal: null), null);
  });

  test('Lpad', () {
    final ext = Extrair();
    expect(ext.lpad('1', 6), '000001');
    expect(ext.lpad('12', 6), '000012');
    expect(ext.lpad(null, 6), null);
    expect(ext.lpad('12', null), null);
    expect(ext.lpad(null, null), null);
  });

  test('Extrair numeros String', () {
    final ext = Extrair();
    expect(ext.numeros('9182d'), '9182');
    expect(ext.numeros('h1h2h3h4'), '1234');
    expect(ext.numeros(null), null);
  });

  test('Validar CPF', () {
    expect(Cpf().validar('13090521660'), true);
    expect(Cpf().validar('13090521661'), false);
    expect(Cpf().validar(null), false);
  });

  test('Buscar Cep', () async {
    Cep cep1 = await Cep.buscar('36512000');
    Cep cep2 = await Cep.buscar('99999999');
    Cep cep3 = await Cep.buscar(null);

    expect(cep1.cep, '36512-000');
    expect(cep2.cep, null);
    expect(cep3.cep, null);
  });
}
