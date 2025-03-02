import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/core/config/env.dart';
import 'package:todo/src/data/datasource/auth_data_source.dart';
import 'package:todo/src/data/repo/auth_repo_impl.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  /// ---- Inicializa Firebase ----
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Env.apiKey,
      projectId: Env.projectId,
      storageBucket: Env.storageBucket,
      messagingSenderId: Env.messagingSenderId,
      appId: Env.appId,
    ),
  );

  /// ---- Registro de FirebaseAuth y Firestore ----
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  ///-----DataSource------

  sl.registerSingleton<AuthDataSource>(AuthDataSourceImpl(auth: sl()));

  ///-----Repositorios------

  sl.registerSingleton<AuthRepo>(AuthRepoImpl(dataSource: sl()));
}
