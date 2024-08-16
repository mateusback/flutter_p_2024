import 'package:flutter_p_2024/app/domain/entities/professor.dart';

abstract class ProfessorDao {
  Future<List<Professor>> find();
  Future<void> save(Professor miss);
  Future<void> remove(dynamic id);
  Future<bool> cpfIsUnique(String cpf);
}
