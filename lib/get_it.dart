import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/core/config/env.dart';
import 'package:todo/src/data/datasource/auth_data_source.dart';
import 'package:todo/src/data/datasource/task_data_source.dart';
import 'package:todo/src/data/datasource/user_data_source.dart';
import 'package:todo/src/data/repo/auth_repo_impl.dart';
import 'package:todo/src/data/repo/task_repo_impl.dart';
import 'package:todo/src/data/repo/user_repo_impl.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';
import 'package:todo/src/domain/repository/task_dto.dart';
import 'package:todo/src/domain/repository/user_repo.dart';

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
  sl.registerSingleton<UserDataSource>(UserDataSourceImpl(firestore: sl()));
  sl.registerSingleton<TaskDataSource>(TaskDataSourceImpl(firestore: sl()));

  ///-----Repositorios------

  sl.registerSingleton<AuthRepo>(AuthRepoImpl(dataSource: sl()));
  sl.registerSingleton<UserRepo>(UserRepoImpl(userDataSource: sl()));
  sl.registerSingleton<TaskRepo>(TaskRepoImpl(dataSource: sl()));
}
