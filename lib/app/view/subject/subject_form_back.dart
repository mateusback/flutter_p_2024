import 'package:flutter/cupertino.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/services/subject_service.dart';
import 'package:get_it/get_it.dart';

class SubjectFormBack {
  var _service = GetIt.I.get<SubjectService>();
  Subject? subject;
  bool? _nameIsValid = false;
  bool? _teacherIsValid = false;
  bool? _periodIsValid = false;

  bool get isValid => _nameIsValid! && _teacherIsValid! && _periodIsValid!;

  SubjectFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    subject = (parameter == null) ? Subject() : parameter as Subject;
  }

  save(BuildContext context) async {
    await _service.save(subject!);
    Navigator.of(context).pop();
  }

  String? validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String? validateTeacher(String name) {
    try {
      _service.validateTeacher(name);
      _teacherIsValid = true;
      return null;
    } catch (e) {
      _teacherIsValid = false;
      return e.toString();
    }
  }

  String? validatePeriod(int value) {
    try {
      _service.validatePeriod(value);
      _periodIsValid = true;
      return null;
    } catch (e) {
      _periodIsValid = false;
      return e.toString();
    }
  }
}
