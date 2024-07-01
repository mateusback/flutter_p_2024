import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';

class CertificateListBack {
  BuildContext context;
  EActivityGroup group;
  List<ComplementaryActivity> activities;

  CertificateListBack(this.context, this.group, this.activities);
}
