import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
import 'package:flutter_p_2024/app/domain/services/complementary_activity_service.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'certificate_list_back.g.dart';

class CertificateListBack = _CertificateListBack with _$CertificateListBack;

abstract class _CertificateListBack with Store {
  var _service = GetIt.I.get<ComplementaryActivityService>();
  EActivityGroup? _group;
  @observable
  late Future<List<ComplementaryActivity>> list;

  @action
  refreshList(EActivityGroup group) {
    list = _service.findByGroup(group);
  }

  _CertificateListBack(this._group) {
    refreshList(_group!);
  }

  goToForm(BuildContext context,
      [ComplementaryActivity? complementaryActivity]) {
    Navigator.of(context)
        .pushNamed(Routes.COMPLEMENTARY_FORM, arguments: complementaryActivity)
        .then((_) => refreshList(_group!));
  }

  @action
  Future<void> remove(dynamic id) async {
    await _service.remove(id);
    refreshList(_group!);
  }
}
