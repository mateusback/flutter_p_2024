import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';

class ComplementaryActivityMapper {
  static ComplementaryActivity fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ComplementaryActivity(
      id: doc.id,
      certificateName: data['certificateName'],
      description: data['description'],
      group: EActivityGroup.values
          .firstWhere((e) => e.toString() == 'EActivityGroup.${data['group']}'),
      hours: data['hours'],
    );
  }

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
