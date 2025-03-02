import 'package:todo/src/data/model/user_model.dart';

class Shared {
  static UserModel? _user;

  static set setUserModel(UserModel u) {
    _user = u;
  }

  static UserModel get getUserModel => _user!;
}
