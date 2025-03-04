import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/src/core/shared/shared.dart';
import 'package:todo/src/data/model/user_model.dart';

abstract class AuthDataSource {
  Future<void> loginWithEmail(
      {required String email, required String password});

  Future<void> registerWithEmail(
      {required String email, required String password});

  Future<dynamic> loginWithGoogle();

  Future<bool> checkSession();

  Future<void> signOut();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth;

  AuthDataSourceImpl({required this.auth});

  @override
  Future<void> registerWithEmail(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      if (kDebugMode) {
        log("error al crear usuario: $e", name: "Error en Datasource");
      }
    }
  }

  @override
  Future loginWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
      
    } catch (e) {
      log("--- $e");
    }
  }

  @override
  Future<bool> checkSession() async {
    bool e = false;

    await for (var user in auth.authStateChanges()) {
      if (user != null) {
        Map<String, dynamic> userMap = {
          'uid': user.uid,
          'email': user.email ?? '',
          'displayName': user.displayName,
          'isEmailVerified': user.emailVerified,
          'creationTime': user.metadata.creationTime,
        };
        Shared.setUserModel = UserModel.fromMap(userMap);
        e = true;
        break;
      } else {
        e = false;
        break;
      }
    }
    return e;
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
      if (kDebugMode) {
        log('Sesión cerrada exitosamente');
      }
    } catch (e) {
      if (kDebugMode) {
        log('Sesión cerrada exitosamente');
      }
    }
  }
}
