import '../../../core/values/const/app_keys.dart';
import '../../../core/utils/get_storage_helper.dart';
import '../../../core/utils/path_util.dart';
import '../../../services/network_client/api_client.dart';
import '../../models/remote/response/signin_response.dart';
import 'auth_repository.dart';

// marker interface
class AuthRepositoryImpl implements AuthRepository {
  //AuthRepositoryImpl._();

  @override
  Future<SignInResponse?> login(String email, String password) async {
    final res = await ApiClient.call(
      'http://192.168.145.167:9040/api/v1/customer/auth/login',
      RequestType.post,
      isAuthorizationRequired: false,
      isLoaderRequired: true,
      isLogRequired: true,
      isRetryRequired: true,
      isCacheRequired: true,
      data: {
        "email_or_phone": email,
        "password": password,
      },
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      final resObj = SignInResponse.fromJson(res.value.data!);

      // save token to local storage
      GetStorageHelper.save<String>(key: authTokenKey, value: resObj.data!.accessToken!);

      return resObj;
    }
    return null;
  }

  @override
  Future<void> download() async {
    final path = await PathUtil.getDownloadPath();
    final res = await ApiClient.download(
      'https://upload.wikimedia.org/wikipedia/commons/7/7e/Goole%2C_Market_Hall_-_geograph.org.uk_-_1881359.jpg',
      savePath: '$path/demo_image.jpg',
      isLoaderRequired: true,
      isAuthorizationRequired: true,
      isLogRequired: true,
      isRetryRequired: true,
      isErrorToastRequired: true,
    );

    if (res.isSuccess) {
      print('Downloaded');
    }
  }
}
