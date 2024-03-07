import 'package:sl_v4/app/core/utils/get_storage_helper.dart';
import 'package:sl_v4/app/data/models/response/login_response.dart';
import 'package:sl_v4/app/services/api_client.dart';

// marker interface
class AuthRepository {
  AuthRepository._();

  static Future<SignInResponse?> login(String email, String password) async {
    final res = await ApiClient.call(
      'http://192.168.145.167:9040/api/v1/customer/auth/login',
      RequestType.post,
      isAuthorizationRequired: false,
      isLoaderRequired: true,
      isLogRequired: true,
      data: {
        "email_or_phone": email,
        "password": password,
      },
    );

    if (res.isSuccess && res.value.data != null) {
      final resObj = loginResponseFromJson(res.value.data!);

      // save token to local storage
      GetStorageHelper.save<String>(key: 'key', value: resObj.data!.accessToken!);

      return resObj;
    }
    return null;
  }
}
