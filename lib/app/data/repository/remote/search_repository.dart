

import '../../../services/network_client/api_client.dart';

abstract class SearchRepository {
  Future<ApiResponse> search({
    required String query,
    required int page,
    String sort = 'stars',
    String order = 'desc',
    int perPage = 20,
  });
}
