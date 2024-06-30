import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_p_2024/app/domain/interfaces/subject_dao.dart';
import 'package:get_it/get_it.dart';

class GradeService {
  var _repository = GetIt.I.get<SubjectDao>();

  final maximumValue = 10.00;
  final minimumValue = 0.00;

  final maximunPeriod = 3;
  final minimunPeriod = 1;

  save(dynamic subjectId, Grade grade) {
    validateValue(grade.value.toString());
    validatePeriod(grade.period.toString());
    _repository.saveGrade(subjectId, grade);
  }

  remove(dynamic subjectId, Grade grade) {
    _repository.removeGrade(subjectId, grade);
  }

  Future<List<Grade>> find(dynamic subjectId) {
    return _repository.findGrades(subjectId);
  }

  validateValue(String value) {
    try {
      double parsedValue = double.tryParse(value)!;
      if (value == null) {
        throw DomainLayerException('A nota é obrigatória');
      } else if (parsedValue > maximumValue) {
        throw DomainLayerException('A nota deve ser menor que {$maximumValue}');
      } else if (parsedValue < minimumValue) {
        throw DomainLayerException('A nota deve ser maior que {$minimumValue}');
      }
    } catch (e) {
      throw DomainLayerException('A nota deve ser um número');
    }
  }

  validatePeriod(String peirod) {
    try {
      int parsedPeriod = int.tryParse(peirod)!;
      if (peirod == null) {
        throw DomainLayerException('O Trimestre é obrigatório');
      } else if (parsedPeriod > maximumValue) {
        throw DomainLayerException(
            'O Trimestre deve ser menor que {$maximunPeriod}');
      } else if (parsedPeriod < minimumValue) {
        throw DomainLayerException(
            'O Trimestre deve ser maior que {$minimunPeriod}');
      }
    } catch (e) {
      throw DomainLayerException('O Trimestre deve ser um número');
    }
  }
}
