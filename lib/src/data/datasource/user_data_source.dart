import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/src/domain/dto/user_dto.dart';

abstract class UserDataSource {
  Future<bool> crearUsuario({required UserDto dto});
}

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore firestore;

  UserDataSourceImpl({required this.firestore});
  @override
  Future<bool> crearUsuario({required UserDto dto}) async {
    try {
      await firestore.collection('users').doc(dto.id).set(dto.toJson());

      return true;
    } catch (e) {
      log("$e");
      return false;
    }
  }
}
