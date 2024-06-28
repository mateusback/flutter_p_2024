import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/database/firestore/dao/subject_dao_impl.dart';
import 'package:flutter_p_2024/app/domain/interfaces/subject_dao.dart';
import 'package:flutter_p_2024/app/domain/services/subject_service.dart';
import 'package:flutter_p_2024/firebase_options.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();
  await startFirebase();
  registerSubjectDependencies(getIt);
}

registerSubjectDependencies(GetIt getIt) {
  getIt.registerSingleton<SubjectDao>(SubjectDaoImpl());
  getIt.registerSingleton<SubjectService>(SubjectService());
}

startFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
