import 'package:flutter_p_2024/app/domain/dto/dto_professor.dart';
import 'package:flutter_p_2024/app/domain/entities/professor.dart';

abstract class IProfessorDao {
  Future<List<Professor>> find();
  DtoProfessor save(DtoProfessor dto);
  Future<void> remove(dynamic id);
  Future<bool> cpfIsUnique(String cpf);
}
