import 'package:flutter_p_2024/app/domain/entities/grade.dart';

abstract class GradeDao {
  Future<List<Grade>> find();
  Future<void> save(Grade grade);
  Future<void> remove(dynamic id);
}
