class UserDto {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final DateTime createAt;
  final DateTime updateAt;

  UserDto(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.createAt,
      required this.updateAt});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "createAt": createAt,
        "updateAt": updateAt,
      };
}
