import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/database/firestore/dao/subject_dao_impl.dart';
import 'package:flutter_p_2024/app/domain/interfaces/subject_dao.dart';
import 'package:flutter_p_2024/app/domain/services/grade_service.dart';
import 'package:flutter_p_2024/app/domain/services/subject_service.dart';
import 'package:flutter_p_2024/app/database/firestore/config/firebase_options.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();
  await startFirebase();
  registerSubjectDependencies(getIt);
  regirterGradesDependencies(getIt);
}

registerSubjectDependencies(GetIt getIt) {
  getIt.registerSingleton<SubjectDao>(SubjectDaoImpl());
  getIt.registerSingleton<SubjectService>(SubjectService());
}

regirterGradesDependencies(GetIt getIt) {
  getIt.registerSingleton<GradeService>(GradeService());
}

startFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
