import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/src/data/model/registro_model.dart';

abstract class AuthDataSource {
  Future<User?> loginWithEmail(
      {required String email, required String password});
  Future<RegistroModel?> registerWithEmail(
      {required String email, required String password});
  Future<dynamic> loginWithGoogle();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth;

  AuthDataSourceImpl({required this.auth});

  @override
  Future<RegistroModel?> registerWithEmail(
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
      return RegistroModel.fromMap(userMap);
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
  Future<User?> loginWithEmail(
      {required String email, required String password}) {
    throw UnimplementedError();
  }
}
