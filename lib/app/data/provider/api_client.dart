import 'package:dio/dio.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/core/utils/interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final _dio = DioClient.initDio(AppConstants.base_url);
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      ResponseType responseType = ResponseType.plain,
      bool logs = true}) async {
    return _dio.get(
      uri,
      queryParameters: query,
      options: Options(responseType: responseType, headers: headers),
    );
  }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      String? contentType,
      bool logs = true}) async {
    var response = await _dio.post(
      uri,
      data: body,
      options: Options(
          contentType: contentType,
          responseType: ResponseType.plain,
          method: "POST",
          headers: headers),
    );
    return response;
  }

  Future<Response> getGooglePlaceData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers, bool logs = false}) async {
    return _dio.get(
      uri,
      queryParameters: query,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  Future<Response> patchData(String uri, dynamic body,
      {Map<String, String>? headers, bool ignoreExceptions = false, bool logs = true}) async {
    return _dio.patch(
      uri,
      data: body,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      Map<String, dynamic>? query,
      bool logs = true}) async {
    return _dio.put(
      uri,
      queryParameters: query,
      data: body,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers, bool ignoreExceptions = false, bool logs = true}) async {
    return _dio.delete(
      uri,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }
}

class ApiClientGoogleCloud {
  final _dio = DioClient.initDio("");
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      ResponseType responseType = ResponseType.plain,
      bool logs = true}) async {
    return _dio.get(
      uri,
      queryParameters: query,
      options: Options(responseType: responseType, headers: headers),
    );
  }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      String? contentType,
      bool logs = true}) async {
    var response = await _dio.post(
      uri,
      data: body,
      options: Options(
          contentType: contentType,
          responseType: ResponseType.plain,
          method: "POST",
          headers: headers),
    );
    return response;
  }
}

class DioClient {
  DioClient._();


  static Dio initDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          maxRedirects: 0),
    );
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    dio.interceptors.add(AppcheckInterceptor());

    return dio;
  }
}






