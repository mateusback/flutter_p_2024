import 'package:flutter_p_2024/app/database/firestore/dao/complementary_activity_dao_impl.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';

class ComplementaryActivityService {
  final _repository = new ComplementaryActivityDaoImpl();

  save(ComplementaryActivity activity) {
    _repository.save(activity);
  }

  remove(dynamic id) {
    _repository.remove(id);
  }

  Future<List<ComplementaryActivity>> find() {
    return _repository.find();
  }

  validateGroup(int value) {
    if (value > EActivityGroup.values.length - 1 || value < 0) {
      throw DomainLayerException('A grupo deve ser um dos informados');
    }
  }

  validateHours(String value, int totalHours, EActivityGroup group) {
    int newHours = 0;
    try {
      newHours = int.parse(value);
    } catch (e) {
      throw 'As horas devem ser um número inteiro';
    }
    int maxHours = 100;
    switch (group) {
      case EActivityGroup.Ensino:
        maxHours = 155;
        break;
      case EActivityGroup.Extensao:
        maxHours = 40;
        break;
      case EActivityGroup.Social:
        maxHours = 40;
        break;
      default:
        throw DomainLayerException('Grupo desconhecido');
    }

    if (newHours < 1) {
      throw DomainLayerException('A quantidade de horas deve ser maior que 0');
    }
    if (totalHours + newHours > maxHours) {
      throw 'O total de horas excede o limite permitido de $maxHours horas. Total Atual: $totalHours horas';
    }
  }
}
