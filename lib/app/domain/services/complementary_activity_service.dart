import 'package:flutter_p_2024/app/database/firestore/dao/complementary_activity_dao_impl.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';

class ComplementaryActivityService {
  final _repository = new ComplementaryActivityDaoImpl();

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

  validateAll(ComplementaryActivity activity) {
    validateGroup(int.parse(activity.group.toString()));
  }

  validateGroup(int value) {
    if (value > 3) {
      throw DomainLayerException('A nota deve ser menor que 3');
    } else if (value < 1) {
      throw DomainLayerException('A nota deve ser maior que 1');
    }
  }
}
