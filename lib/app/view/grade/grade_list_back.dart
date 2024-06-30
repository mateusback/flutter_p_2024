import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/services/grade_service.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'grade_list_back.g.dart';

class GradeListBack = _GradeListBack with _$GradeListBack;

abstract class _GradeListBack with Store {
  final _service = GetIt.I.get<GradeService>();

  @observable
  late Future<List<Grade>> list;

  @action
  refreshList(dynamic subjectId) {
    list = _service.find(subjectId);
  }

  _GradeListBack(dynamic subjectId) {
    refreshList(subjectId);
  }

  goToForm(BuildContext context, Subject? subject) {
    Navigator.of(context)
        .pushNamed(Routes.GRADE_FORM, arguments: subject)
        .then((_) => refreshList(subject!.id));
  }

  remove(dynamic id, Grade? grade, BuildContext context) async {
    await _service.remove(id, grade!);
    refreshList(id);
    Navigator.of(context).pop();
  }
}
