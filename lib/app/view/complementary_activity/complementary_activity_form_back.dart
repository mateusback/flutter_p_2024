import 'package:flutter/cupertino.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/services/complementary_activity_service.dart';
import 'package:get_it/get_it.dart';

class ComplementaryActivityFormBack {
  var _service = GetIt.I.get<ComplementaryActivityService>();
  ComplementaryActivity? activity;
  bool? _groupIsValid = false;
  bool? _hoursIsValid = false;
  BuildContext? _context;

  bool get isValid => _groupIsValid! && _hoursIsValid!;

  ComplementaryActivityFormBack(BuildContext context) {
    this._context = context;
    var parameters = ModalRoute.of(context)!.settings.arguments;
    activity = (parameters != null)
        ? parameters as ComplementaryActivity
        : ComplementaryActivity();
  }

  save(BuildContext context) async {
    validateAll();
    await _service.save(activity!);
    Navigator.of(context).pop();
  }

  validateAll() {
    validateGroup(activity!.group.toString());
    validateHours(activity!.hours.toString());
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

  validateHours(String value) {
    try {
      _service.validateHours(value);
      _hoursIsValid = true;
      return null;
    } catch (e) {
      _hoursIsValid = false;
      return e.toString();
    }
  }

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    return indexOfDot == -1
        ? description
        : description.substring(indexOfDot + 1);
  }
}
