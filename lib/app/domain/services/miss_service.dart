import 'package:flutter_p_2024/app/domain/entities/miss.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_p_2024/app/domain/interfaces/miss_dao.dart';
import 'package:get_it/get_it.dart';

class MissService {
  final _repository = GetIt.I.get<MissDao>();

  save(Miss miss) {
    validateAll(miss);
    _repository.save(miss);
  }

  remove(int id) {
    _repository.remove(id);
  }

  Future<List<Miss>> find() {
    return _repository.find();
  }

  validateAll(Miss miss) {
    validateDate(miss.date);
  }

  validateDate(DateTime? date) {
    if (date == null) {
      throw DomainLayerException('É necessário inserir uma data');
    }
  }
}
