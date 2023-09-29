import 'package:dio/dio.dart';
import 'package:mr_white/pages/demo_api_client/model/get_users_response.dart';
import 'package:mr_white/utils/api_provider/api_provider.dart';

class DemoApiClientRepository {
  late Dio _dio;

  DemoApiClientRepository() {
    _dio = ApiProvider.dio;
  }

  Future<GetUsersResponse> getUsers({required int page}) async {
    var response = await _dio.get('https://reqres.in/api/users?page=$page&per_page=10');
    return GetUsersResponse.fromJson(response.data);
  }
}
