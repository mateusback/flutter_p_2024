import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/subject_mapper.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/miss.dart';

void insertTestSubject() async {
  Subject subject = Subject(
    name: 'Matemática',
    teacherName: 'Professor X',
    grades: [
      Grade(value: 9.5, period: 1),
      Grade(value: 8.0, period: 2),
    ],
    period: 2,
    misses: [
      Miss(date: DateTime.parse('2023-06-10T00:00:00Z')),
      Miss(date: DateTime.parse('2023-06-20T00:00:00Z')),
    ],
  );

  Map<String, dynamic> subjectMap = SubjectMapper.toMap(subject);

  CollectionReference subjectsCollection =
      FirebaseFirestore.instance.collection('subject');

  await subjectsCollection.add(subjectMap).then((docRef) {
    print("Subject added with ID: ${docRef.id}");
  }).catchError((error) {
    print("Error adding subject: $error");
  });
}
