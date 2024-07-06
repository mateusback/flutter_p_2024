import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';

abstract class ComplementaryActivityDao {
  Future<List<ComplementaryActivity>> find();
  Future<List<ComplementaryActivity>> findByGroup(EActivityGroup group);
  Future<int> getTotalHoursByGroup(EActivityGroup group);
  Future<void> save(ComplementaryActivity acttivity);
  Future<void> remove(dynamic id);
}
