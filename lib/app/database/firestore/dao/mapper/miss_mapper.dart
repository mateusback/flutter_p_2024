import 'package:flutter_p_2024/app/domain/entities/miss.dart';

class MissMapper {
  static Miss fromMap(Map<String, dynamic> data) {
    return Miss(
      id: data['id'],
      subjectId: data['subjectId'],
      date: data['date']?.toDate(),
    );
  }

  static Map<String, dynamic> toMap(Miss miss) {
    return {
      'id': miss.id,
      'subjectId': miss.subjectId,
      'date': miss.date,
    };
  }
}
