import 'package:flutter_p_2024/app/domain/cpf.dart';
import 'package:flutter_p_2024/app/domain/dto/dto_professor.dart';
import 'package:flutter_p_2024/app/domain/entities/professor.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Testes de professor', () {
    test('Deve criar um professor válido', () {
      expect(
          () => new Professor(
              new DtoProfessor(nome: 'mateus', cpf: '317.184.960-79')),
          returnsNormally);
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
