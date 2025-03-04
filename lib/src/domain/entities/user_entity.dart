import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String? displayName;
  final DateTime creationTime;

  const UserEntity({
    required this.uid,
    required this.email,
    this.displayName,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        displayName,
        creationTime,
      ];

  UserEntity copyWith({
    String? uid,
    String? email,
    String? displayName,
    DateTime? creationTime,
  }) =>
      UserEntity(
          uid: uid ?? this.uid,
          email: email ?? this.email,
          creationTime: creationTime ?? this.creationTime,
          displayName: displayName ?? this.displayName
          );
}
