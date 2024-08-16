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
  var _service = GetIt.I.get<GradeService>();
  late final Subject subject;

  _GradeListBack(BuildContext context, Subject? subject) {
    this.subject = subject!;
    refreshList();
  }

  @observable
  late Future<List<Grade>> list;

  @action
  Future<void> refreshList() async {
    list = _service.find(subject.id);
  }

  void goToForm(BuildContext context, Grade grade) {
    Navigator.of(context).pushNamed(
      Routes.GRADE_FORM,
      arguments: {'grade': grade, 'subjectId': subject.id},
    ).then((_) => refreshList());
  }

  void remove(BuildContext context, Grade grade) async {
    await _service.remove(subject.id, grade);
    refreshList();
    Navigator.of(context).pop();
  }
}
