import 'package:flutter/cupertino.dart';
import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/services/grade_service.dart';
import 'package:get_it/get_it.dart';

class GradeFormBack {
  var _service = GetIt.I.get<GradeService>();
  Grade? grade;
  dynamic subjectId;
  bool? _valueIsValid;
  bool? _periodIsValid;

  bool get isValid => _valueIsValid! && _periodIsValid!;

  GradeFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments as Map?;
    grade = (parameter == null) ? Grade() : parameter['grade'] as Grade;
    subjectId = (parameter == null) ? null : parameter['subjectId'] as dynamic;
  }

  save(BuildContext context) async {
    await _service.save(subjectId, grade!);
    Navigator.of(context).pop();
  }

  String? validateValue(String value) {
    try {
      _service.validateValue(value);
      _valueIsValid = true;
      return null;
    } catch (e) {
      _valueIsValid = false;
      return e.toString();
    }
  }

  String? validatePeriod(String value) {
    try {
      _service.validatePeriod(value);
      _valueIsValid = true;
      return null;
    } catch (e) {
      _valueIsValid = false;
      return e.toString();
    }
  }
}
