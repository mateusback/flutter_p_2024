import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';

abstract class ComplementaryActivityDao {
  Future<List<ComplementaryActivity>> find();
  Future<void> save(ComplementaryActivity acttivity);
  Future<void> remove(dynamic id);
}
