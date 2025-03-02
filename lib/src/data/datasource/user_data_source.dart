import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/src/domain/dto/user_dto.dart';

abstract class UserDataSource {
  Future<dynamic> crearUsuario({required UserDto dto});
}


class UserDataSourceImpl implements UserDataSource{
  final FirebaseFirestore firestore;

  UserDataSourceImpl({required this.firestore});
  @override
  Future crearUsuario({required UserDto dto}) {
    // TODO: implement crearUsuario
    throw UnimplementedError();
  }
}