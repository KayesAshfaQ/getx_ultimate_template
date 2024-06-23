import '../../../services/network_client/api_client.dart';

abstract class SearchRepository {
  Future<ApiResponse> search({
    required String query,
    required int page,
    String sort,
    String order,
    int perPage,
  });
}
