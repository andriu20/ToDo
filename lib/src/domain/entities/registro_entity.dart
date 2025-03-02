import 'package:equatable/equatable.dart';

class RegistrEontity extends Equatable {
  final String uid;
  final String email;
  final String? displayName;
  final bool isEmailVerified;
  final DateTime creationTime;

  const RegistrEontity({
    required this.uid,
    required this.email,
    this.displayName,
    required this.isEmailVerified,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        displayName,
        isEmailVerified,
        creationTime,
      ];

  RegistrEontity copyWith({
    String? uid,
    String? email,
    String? displayName,
    bool? isEmailVerified,
    DateTime? creationTime,
  }) =>
      RegistrEontity(
          uid: uid ?? this.uid,
          email: email ?? this.email,
          isEmailVerified: isEmailVerified ?? this.isEmailVerified,
          creationTime: creationTime ?? this.creationTime,
          displayName: displayName ?? this.displayName,
          );
}
