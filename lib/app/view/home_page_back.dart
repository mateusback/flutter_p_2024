import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/grades.dart';
import 'package:flutter_p_2024/app/domain/services/grades_service.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'home_page_back.g.dart';

class HomePageBack = _HomePageBack with _$HomePageBack;

abstract class _HomePageBack with Store {
  final GradesService _service = GetIt.I.get<GradesService>();

  @observable
  ObservableFuture<List<Grades>>? list;

  _HomePageBack() {
    refreshlist();
  }

  @action
  void refreshlist() {
    list = ObservableFuture(_service.find());
  }

  void goToForm(BuildContext context, [Grades? grades]) {
    Navigator.of(context)
        .pushNamed(Routes.GRADES_FORM, arguments: grades)
        .then((_) => refreshlist());
  }

  void remove(int id) {
    _service.remove(id);
    refreshlist();
  }
}
