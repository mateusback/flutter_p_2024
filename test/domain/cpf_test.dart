import 'package:flutter_p_2024/app/domain/cpf.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Testes de CPF', () {
    test('Não deve criar um cpf válido', () {
      expect(() => CPF('10986132950'), returnsNormally);
    });
    test('Não deve aceitar um CPF vazio', () {
      expect(() => CPF(''), throwsA(isA<ArgumentError>()));
    });
    test('Não deve aceitar um CPF com menos de 11 dígitos', () {
      expect(() => CPF('123.46.789-40'), throwsA(isA<ArgumentError>()));
    });
    test('Não deve aceitar um CPF com mais de 11 dígitos', () {
      expect(() => CPF('123.436.789-403'), throwsA(isA<ArgumentError>()));
    });
  });
}
