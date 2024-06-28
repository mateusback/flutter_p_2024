import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';

class ComplementaryActivity {
  dynamic id;
  String? certificateName;
  String? description;
  EActivityGroup group;
  int hours;

  ComplementaryActivity({
    this.id,
    this.certificateName,
    this.description,
    required this.group,
    required this.hours,
  });
}
