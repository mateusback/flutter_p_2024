import 'package:flutter_p_2024/app/database/sqlite/dao/grades_dao_impl.dart';
import 'package:flutter_p_2024/app/domain/interfaces/grades_dao.dart';
import 'package:flutter_p_2024/app/domain/services/grades_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<GradesDao>(GradesDaoImpl());
  getIt.registerSingleton<GradesService>(GradesService());
}
