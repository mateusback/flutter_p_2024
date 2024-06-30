import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/grade_mapper.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/subject_mapper.dart';
import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/interfaces/subject_dao.dart';

class SubjectDaoImpl implements SubjectDao {
  CollectionReference? subjectCollection;

  SubjectDaoImpl() {
    subjectCollection = FirebaseFirestore.instance.collection('subject');
  }

  @override
  Future<List<Subject>> find() async {
    var result = await subjectCollection!.get();
    return result.docs
        .map(
          (doc) => SubjectMapper.fromFirestore(doc),
        )
        .toList();
  }

  @override
  remove(id) async {
    await subjectCollection!.doc(id).delete();
  }

  @override
  save(Subject subject) async {
    await subjectCollection!.doc(subject.id).set(SubjectMapper.toMap(subject));
  }

  @override
  Future<List<Grade>> findGrades(dynamic id) async {
    var doc = await subjectCollection!.doc(id).get();
    if (doc.exists) {
      return SubjectMapper.gradesFromFirestore(doc);
    } else {
      return [];
    }
  }

  @override
  Future<void> removeGrade(dynamic subjectId, Grade grade) async {
    var doc = subjectCollection!.doc(subjectId);
    var snapshot = await doc.get();
    if (snapshot.exists) {
      var data = snapshot.data() as Map<String, dynamic>;
      List grades = data['grades'];
      grades.removeWhere(
          (g) => g['value'] == grade.value && g['perido'] == grade.period);
      await doc.update({'grades': grades});
    }
  }

  @override
  Future<void> saveGrade(dynamic subjectId, Grade grade) async {
    var doc = subjectCollection!.doc(subjectId);
    var snapshot = await doc.get();
    if (snapshot.exists) {
      var data = snapshot.data() as Map<String, dynamic>;
      List grades = data['grades'];
      grades.add(GradeMapper.toMap(grade));
      await doc.update({'grades': grades});
    } else {
      await doc.set({
        'grades': [GradeMapper.toMap(grade)],
      });
    }
  }

  @override
  Future<void> updateGrade(
      dynamic subjectId, Grade oldGrade, Grade newGrade) async {
    var doc = subjectCollection!.doc(subjectId);
    var snapshot = await doc.get();
    if (snapshot.exists) {
      var data = snapshot.data() as Map<String, dynamic>;
      List grades = data['grades'];
      int index = grades.indexWhere((g) =>
          g['value'] == oldGrade.value && g['period'] == oldGrade.period);
      if (index != -1) {
        grades[index] = GradeMapper.toMap(newGrade);
        await doc.update({'grades': grades});
      }
    }
  }
}
