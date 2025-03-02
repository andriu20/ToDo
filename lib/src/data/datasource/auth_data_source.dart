import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/src/data/model/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel?> loginWithEmail(
      {required String email, required String password});

  Future<UserModel?> registerWithEmail(
      {required String email, required String password});

  Future<dynamic> loginWithGoogle();

  Future<bool> checkSession();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth;

  AuthDataSourceImpl({required this.auth});

  @override
  Future<UserModel?> registerWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user!;
      Map<String, dynamic> userMap = {
        'uid': user.uid,
        'email': user.email ?? '',
        'displayName': user.displayName,
        'isEmailVerified': user.emailVerified,
        'creationTime': user.metadata.creationTime,
      };
      return UserModel.fromMap(userMap);
    } catch (e) {
      if (kDebugMode) {
        log("error al crear usuario: $e", name: "Error en Datasource");
      }
      return null;
    }
  }

  @override
  Future loginWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user.user != null) {
        final uu = user.user!;
        Map<String, dynamic> userMap = {
          'uid': uu.uid,
          'email': uu.email ?? '',
          'displayName': uu.displayName,
          'isEmailVerified': uu.emailVerified,
          'creationTime': uu.metadata.creationTime,
        };
        return UserModel.fromMap(userMap);
      } else {
        return null;
      }
    } catch (e) {
      log("--- $e");
      return null;
    }
  }

  @override
  Future<bool> checkSession() async {
    bool e = false;

    // Usamos await for para esperar la emisión de cambios del stream
    await for (var user in auth.authStateChanges()) {
      if (user != null) {
        // El usuario está autenticado
        e = true;
        break; // Si ya sabemos que está autenticado, podemos salir del loop
      } else {
        // El usuario no está autenticado
        e = false;
      }
    }

    return e;
  }
}
