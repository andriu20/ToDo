abstract class AuthDataSource {
  Future<dynamic> loginWithEmail(
      {required String email, required String password});
  Future<dynamic> loginWithGoogle();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future loginWithEmail(
      {required String email, required String password}) async {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future loginWithGoogle() async {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
