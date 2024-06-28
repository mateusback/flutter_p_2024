import 'package:flutter_p_2024/app/domain/entities/miss.dart';

abstract class MissDao {
  Future<List<Miss>> find();
  Future<void> save(Miss miss);
  Future<void> remove(dynamic id);
}
