import 'package:flutter_test/flutter_test.dart';
import 'package:veev_utils/veev_utils.dart';

void main() {
  test('Data para String', () {
    final ext = Extrair();
    expect(ext.dataParaTexto(DateTime(2020, 10, 28)), '28/10/2020');
    expect(ext.dataParaTexto(DateTime(2020, 1, 1)), '01/01/2020');
  });
  test('String para Data', () {
    final ext = Extrair();
    expect(ext.textoParaData('28/10/2020'), DateTime(2020, 10, 28));
    expect(ext.textoParaData('01/01/2020'), DateTime(2020, 1, 1));
  });
}
