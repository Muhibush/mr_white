import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:mr_white/utils/api_provider/interceptor/interceptor_header.dart';

class ApiProvider {
  static const retriesCount = 5;
  static final _dio = Dio();

  static init() async {
    _dio.options
      ..followRedirects = false
      ..responseType = ResponseType.json;
    var dioInterceptors = _dio.interceptors;
    dioInterceptors
      ..add(interceptorsHeader())
      ..add(RetryInterceptor(dio: _dio, retries: retriesCount));
  }

  static Dio get dio {
    return _dio;
  }
}
