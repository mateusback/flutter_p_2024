import 'package:flutter_p_2024/app/domain/cpf.dart';
import 'package:flutter_p_2024/app/domain/dto/dto_professor.dart';
import 'package:flutter_p_2024/app/domain/interfaces/professor_dao.dart';

class Professor {
  late dynamic id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String _status;
  String get status => _status;
  set status(String value) {
    if (value != 'A' || value != 'I') throw ArgumentError('Invalid status');
    _status = value;
  }

  Professor(
    DtoProfessor dto,
  ) {
    id = dto.id;
    nome = dto.nome;
    descricao = dto.descricao;
    cpf = dto.cpf;
    CPF(cpf);
    status = dto.status;
  }

  void ehNomeVazio(String nome) {
    if (nome.isEmpty) throw ArgumentError('Name cannot be empty');
  }
}
