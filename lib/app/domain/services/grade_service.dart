import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_p_2024/app/domain/interfaces/grade_dao.dart';
import 'package:get_it/get_it.dart';

class GradeService {
  var _repository = GetIt.I.get<GradeDao>();

  final maximumValue = 10.00;
  final minimumValue = 0.00;

  save(Grade grade) {
    validateValue(grade.value);
    _repository.save(grade);
  }

  remove(int id) {
    _repository.remove(id);
  }

  Future<List<Grade>> find() {
    return _repository.find();
  }

  validateValue(double? value) {
    if (value == null) {
      throw DomainLayerException('A nota é obrigatória');
    } else if (value > maximumValue) {
      throw DomainLayerException('A nota deve ser menor que 10.00');
    } else if (value < minimumValue) {
      throw DomainLayerException('A nota deve ser maior que 0.00');
    }
  }
}
