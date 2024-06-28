import 'package:flutter_p_2024/app/domain/entities/subject.dart';

abstract class SubjectDao {
  Future<List<Subject>> find();
  Future<void> save(Subject subject);
  Future<void> remove(dynamic id);
}
