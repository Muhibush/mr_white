import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mr_white/utils/api_provider/interceptor/interceptor_constant.dart';
import 'package:mr_white/utils/shared_preference_mr_white.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

InterceptorsWrapper interceptorsHeader() {
  return InterceptorsWrapper(
    onRequest: (optionRequest, handler) async {
      var textUserAgent = await userAgent();
      optionRequest.headers[InterceptorConstant.userAgent] =
          '${InterceptorConstant.prefixMobileUserAgent}/$textUserAgent';

      optionRequest.headers[InterceptorConstant.device] = Platform.isAndroid
          ? InterceptorConstant.android
          : InterceptorConstant.ios;

      optionRequest.headers[InterceptorConstant.device] = Platform.isAndroid
          ? InterceptorConstant.android
          : InterceptorConstant.ios;

      /// TODO switch env
      var environment = SharedPreferenceMrWhite.getEnv();
      optionRequest.headers[InterceptorConstant.environment] = environment;

      return handler.next(optionRequest);
    },
    onResponse: (e, handler) {
      return handler.next(e);
    },
  );
}
