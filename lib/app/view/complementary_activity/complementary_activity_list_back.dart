import 'package:flutter/cupertino.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/services/complementary_activity_service.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'complementary_activity_list_back.g.dart';

class ComplementaryActivityListBack = _ComplementaryActivityListBack
    with _$ComplementaryActivityListBack;

abstract class _ComplementaryActivityListBack with Store {
  var _service = GetIt.I.get<ComplementaryActivityService>();

  @observable
  late Future<List<ComplementaryActivity>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ComplementaryActivityListBack() {
    refreshList();
  }

  goToGradesList(BuildContext context, [Subject? subject]) {
    Navigator.of(context).pushNamed(Routes.HOME, arguments: subject);
  }

  goToForm(BuildContext context, [Subject? subject]) {
    Navigator.of(context).pushNamed(Routes.HOME, arguments: subject);
  }

  gotToDetails(BuildContext context, Subject subject) {
    Navigator.of(context).pushNamed(Routes.HOME, arguments: subject);
  }

  remove(BuildContext context, dynamic complementaryId) async {
    await _service.remove(complementaryId);
    refreshList();
    Navigator.of(context).pop();
  }
}
