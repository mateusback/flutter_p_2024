import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';

class ComplementaryActivityMapper {
  static ComplementaryActivity fromMap(Map<String, dynamic> data) {
    return ComplementaryActivity(
      id: data['id'],
      certificateName: data['certificateName'],
      description: data['description'],
      group: EActivityGroupExtension.fromInt(data['group']),
      hours: data['hours'],
    );
  }

  static Map<String, dynamic> toMap(ComplementaryActivity activity) {
    return {
      'id': activity.id,
      'certificateName': activity.certificateName,
      'description': activity.description,
      'group': activity.group.toInt(),
      'hours': activity.hours,
    };
  }
}
