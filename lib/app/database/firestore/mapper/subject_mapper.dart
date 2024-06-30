import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/grade_mapper.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/miss_mapper.dart';
import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';

class SubjectMapper {
  static Subject fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Subject(
      id: doc.id,
      name: data['name'],
      teacherName: data['teacherName'],
      grades: (data['grades'] as List)
          .map((grade) => GradeMapper.fromMap(grade))
          .toList(),
      period: data['period'],
      misses: (data['misses'] as List)
          .map((miss) => MissMapper.fromMap(miss))
          .toList(),
    );
  }

  static List<Grade> gradesFromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return (data['grades'] as List)
        .map((grade) => GradeMapper.fromMap(grade))
        .toList();
  }

  static Map<String, dynamic> toMap(Subject subject) {
    return {
      'name': subject.name,
      'teacherName': subject.teacherName,
      'grades':
          subject.grades?.map((grade) => GradeMapper.toMap(grade)).toList(),
      'period': subject.period,
      'misses': subject.misses?.map((miss) => MissMapper.toMap(miss)).toList(),
    };
  }
}
