import 'package:flutter_p_2024/app/database/firestore/dao/complementary_activity_dao_impl.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
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
    if (value > EActivityGroup.values.length - 1 || value < 0) {
      throw DomainLayerException('A grupo deve ser um dos informados');
    }
  }

  validateHours(String value) {
    try {
      int.tryParse(value);
    } catch (e) {
      throw DomainLayerException(
          'A quantidade de horas deve ser um número inteiro');
    }
    var parsedvalue = int.parse(value);
    if (parsedvalue < 1) {
      throw DomainLayerException('A quantidade de horas deve ser maior que 0');
    }
  }
}
