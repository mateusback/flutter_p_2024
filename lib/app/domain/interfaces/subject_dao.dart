import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';

abstract class SubjectDao {
  Future<List<Subject>> find();
  Future<void> save(Subject subject);
  Future<void> remove(dynamic id);

  Future<void> saveGrade(dynamic subjectId, Grade grade);
  Future<void> removeGrade(dynamic subjectId, Grade grade);
  Future<void> updateGrade(dynamic subjectId, Grade oldGrade, Grade newGrade);
  Future<List<Grade>> findGrades(dynamic subjectId);
}
