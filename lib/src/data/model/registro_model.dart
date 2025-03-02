import 'package:todo/src/domain/entities/registro_entity.dart';

class RegistroModel extends RegistrEontity {
  const RegistroModel({
    required super.uid,
    required super.email,
    super.displayName,
    required super.isEmailVerified,
    required super.creationTime,
  });

  factory RegistroModel.fromMap(Map<String, dynamic> map) {
    return RegistroModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'],
      isEmailVerified: map['isEmailVerified'] ?? false,
      creationTime: map['creationTime'] ?? DateTime.now(),
    );
  }
}
