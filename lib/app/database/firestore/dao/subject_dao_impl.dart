import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/subject_mapper.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/interfaces/subject_dao.dart';

class SubjectDaoImpl implements SubjectDao {
  CollectionReference? subjectCollention;

  SubjectDaoImpl() {
    subjectCollention = FirebaseFirestore.instance.collection('subjects');
  }

  @override
  Future<List<Subject>> find() async {
    var result = await subjectCollention!.get();
    return result.docs
        .map(
          (doc) => SubjectMapper.fromFirestore(doc),
        )
        .toList();
  }

  @override
  remove(id) async {
    await subjectCollention!.doc(id).delete();
  }

  @override
  save(Subject subject) async {
    await subjectCollention!.doc(subject.id).set(SubjectMapper.toMap(subject));
  }
}
