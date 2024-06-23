import '../../../../flavors/build_config.dart';
import '../../../core/values/const/api_end_points.dart';
import '../../../services/network_client/api_client.dart';
import 'search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<ApiResponse> search({
    required String query,
    required int page,
    String sort = 'stars',
    String order = 'desc',
    int perPage = 20,
  }) async {
    final baseUrl = BuildConfig.instance.config.baseUrl;

    final res = await ApiClient.call(
      '$baseUrl${ApiEndPoints.search_repository}',
      RequestType.get,
      queryParameters: {
        'q': query,
        'sort': sort,
        'order': order,
        'page': page,
        'per_page': perPage,
      },
    );

    return res;
  }
}
