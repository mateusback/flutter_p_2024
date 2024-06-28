import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/miss.dart';

class Subject {
  dynamic id;
  String? name;
  String? teacherName;
  List<Grade>? grades;
  int? period;
  List<Miss>? misses;

  Subject({
    this.id,
    this.name,
    this.teacherName,
    this.grades,
    this.period,
    this.misses,
  });
}
