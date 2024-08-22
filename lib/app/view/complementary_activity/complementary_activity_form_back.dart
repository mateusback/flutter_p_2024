import 'package:flutter/cupertino.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
import 'package:flutter_p_2024/app/domain/services/complementary_activity_service.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:get_it/get_it.dart';

class ComplementaryActivityFormBack {
  var _service = GetIt.I.get<ComplementaryActivityService>();
  ComplementaryActivity? activity;
  bool? _groupIsValid = false;
  bool? _hoursIsValid = false;

  bool get isValid => _groupIsValid! && _hoursIsValid!;

  ComplementaryActivityFormBack(BuildContext context) {
    var parameters = ModalRoute.of(context)!.settings.arguments;
    activity = (parameters != null)
        ? parameters as ComplementaryActivity
        : ComplementaryActivity();
  }

  save(BuildContext context) async {
    await _service.save(activity!);
    Navigator.of(context).pushNamed(Routes.COMPLEMENTARY_LIST);
  }

  validateGroup(String value) {
    try {
      _service.validateGroup(int.parse(value));
      _groupIsValid = true;
      return null;
    } catch (e) {
      _groupIsValid = false;
      return e.toString();
    }
  }

  validateHours(String value, int hours, EActivityGroup group) {
    try {
      _service.validateHours(value, hours, group);
      _hoursIsValid = true;
      return null;
    } catch (e) {
      _hoursIsValid = false;
      return e.toString();
    }
  }

  Future<int> getHours(EActivityGroup group) {
    return Future.value(0);
  }

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    return indexOfDot == -1
        ? description
        : description.substring(indexOfDot + 1);
  }
}
