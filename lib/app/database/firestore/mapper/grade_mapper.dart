import 'package:flutter_p_2024/app/domain/entities/grade.dart';

class GradeMapper {
  static Grade fromMap(Map<String, dynamic> data) {
    return Grade(
      id: data['id'],
      period: data['period'],
      value: data['value']?.toDouble() ?? 0.0,
    );
  }

  static Map<String, dynamic> toMap(Grade grade) {
    return {
      'id': grade.id,
      'period': grade.period,
      'value': grade.value,
    };
  }
}
