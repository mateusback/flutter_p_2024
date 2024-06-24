import 'package:flutter_p_2024/app/domain/entities/grades.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_p_2024/app/domain/interfaces/grades_dao.dart';
import 'package:get_it/get_it.dart';

class GradesService {
  var _repository = GetIt.I.get<GradesDao>();

  save(Grades grades) {
    validateName(grades.nome!);
    _repository.save(grades);
  }

  remove(int id) {
    _repository.remove(id);
  }

  Future<List<Grades>> find() {
    return _repository.find();
  }

  validateName(String? name) {
    if (name == null || name.isEmpty) {
      throw DomainLayerException('O nome é obrigatório');
    } else if (name.length < 3) {
      throw DomainLayerException('O nome deve ter pelo menos 3 caracteres');
    } else if (name.length > 50) {
      throw DomainLayerException('O nome deve ter no máximo 50 caracteres');
    }
  }

  validateNota(double? nota) {
    if (nota == null) {
      throw DomainLayerException('A nota é obrigatória');
    } else if (nota > 10.00) {
      throw DomainLayerException('A nota deve ser menor que 10.00');
    } else if (nota < 0.00) {
      throw DomainLayerException('A nota deve ser maior que 0.00');
    }
  }
}
