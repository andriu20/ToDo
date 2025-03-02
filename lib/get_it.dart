import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/core/config/env.dart';
import 'package:todo/src/data/datasource/auth_data_source.dart';
import 'package:todo/src/data/repo/auth_repo_impl.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  ///-----DataSource------

  sl.registerSingleton<AuthDataSource>(AuthDataSourceImpl());

  ///-----Repositorios------

  sl.registerSingleton<AuthRepo>(AuthRepoImpl(dataSource: sl()));

  ///----OTROS-----

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Env.apiKey,
      projectId: Env.projectId,
      storageBucket: Env.storageBucket,
      messagingSenderId: Env.messagingSenderId,
      appId: Env.appId,
    ),
  );
}
