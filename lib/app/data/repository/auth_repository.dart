import '../models/response/signin_response.dart';

abstract class AuthRepository {
  Future<SignInResponse?> login(String email, String password);

  Future<void> download();
}
