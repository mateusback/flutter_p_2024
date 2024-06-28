import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/interfaces/complementary_activity_dao.dart';
import 'package:get_it/get_it.dart';

class ComplementaryActivityService {
  final _repository = GetIt.I.get<ComplementaryActivityDao>();

  save(ComplementaryActivity activity) {
    validateAll(activity);
    _repository.save(activity);
  }

  remove(int id) {
    _repository.remove(id);
  }

  Future<List<ComplementaryActivity>> find() {
    return _repository.find();
  }

  validateAll(ComplementaryActivity activity) {}
}
