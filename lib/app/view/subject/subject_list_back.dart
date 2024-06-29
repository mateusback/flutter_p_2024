import 'package:flutter/cupertino.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/domain/services/subject_service.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'subject_list_back.g.dart';

class SubjectListBack = _SubjectListBack with _$SubjectListBack;

abstract class _SubjectListBack with Store {
  final _service = GetIt.I.get<SubjectService>();

  @observable
  late Future<List<Subject>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _SubjectListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Subject? subject]) {
    Navigator.of(context)
        .pushNamed(Routes.HOME, arguments: subject) //TODO - MUDAR A ROTA
        .then(refreshList);
  }

  goToDetails(BuildContext context, Subject? subject) {
    Navigator.of(context)
        .pushNamed(Routes.HOME, arguments: subject); //TODO - MUDAR A ROTA
  }

  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
