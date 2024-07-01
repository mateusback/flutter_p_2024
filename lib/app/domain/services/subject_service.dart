import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_p_2024/app/domain/interfaces/subject_dao.dart';
import 'package:get_it/get_it.dart';

class SubjectService {
  final _repository = GetIt.I.get<SubjectDao>();

  final minimumLength = 3;
  final maximumLength = 50;
  final minimumPeriod = 1;
  final maximumPeriod = 5;

  save(Subject subject) {
    validateAll(subject);
    _repository.save(subject);
  }

  remove(dynamic id) {
    _repository.remove(id);
  }

  Future<List<Subject>> find() {
    return _repository.find();
  }

  validateAll(Subject subject) {
    validateName(subject.name);
    validateTeacher(subject.teacherName);
    validatePeriod(subject.period);
  }

  validateName(String? name) {
    if (name == null) {
      throw DomainLayerException('O nome da matéria é obrigatório');
    } else if (name.length < minimumLength) {
      throw DomainLayerException(
          'O nome da matéria deve ter mais de 3 caracteres');
    } else if (name.length > maximumLength) {
      throw DomainLayerException(
          'O nome da matéria deve ter menos de 50 caracteres');
    }
  }

  validateTeacher(String? teacher) {
    if (teacher == null) {
      throw DomainLayerException('O nome do professor é obrigatório');
    } else if (teacher.length < minimumLength) {
      throw DomainLayerException(
          'O nome do professor deve ter mais de 3 caracteres');
    } else if (teacher.length > maximumLength) {
      throw DomainLayerException(
          'O nome do professor deve ter menos de 50 caracteres');
    }
  }

  validatePeriod(int? period) {
    if (period == null) {
      throw DomainLayerException('O ano da matéria é obrigatório');
    } else if (period < minimumPeriod) {
      throw DomainLayerException('O ano da matéria deve ser maior que 0');
    } else if (period > maximumPeriod) {
      throw DomainLayerException('O ano da matéria deve ser menor que 5');
    }
  }
}
