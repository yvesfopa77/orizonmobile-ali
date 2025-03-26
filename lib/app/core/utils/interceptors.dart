import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/data/services/auth_service.dart';

class AppcheckInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final appCheckToken = await FirebaseAppCheck.instance.getToken();
    final AuthService authService = Get.find();

    if (appCheckToken != null) {
      options.headers['X-Firebase-AppCheck'] = appCheckToken;
      if (authService.accessToken != null) {
        options.headers["Authorization"] = authService.accessToken;
      }
      handler.next(options);
    } else {
      handler.reject(
        DioException(
            requestOptions: options,
            error: 'App Check token is null',
            type: DioExceptionType.badResponse),
      );
    }
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   handler.next(response);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if (err.response?.statusCode == 500) {
    //   ErrorDialogs.internalServerError();
    // }

    return handler.resolve(err.response ?? Response(requestOptions: err.requestOptions));
  }
}
