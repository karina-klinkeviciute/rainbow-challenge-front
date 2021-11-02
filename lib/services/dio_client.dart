import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rainbow_challenge/constants/api.dart';

// TO DO: Add interceptors
// We could create helper methods that can be used for various
// networking scenarios

/*
class DioClient {
  static final String baseUrl = Api.baseUrl;
  static final String endpointUrl = '';
  static final String 
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
     headers: {
              "authorization": "Bearer $token",
            },
  );

final Dio _dio = Dio(opts)..interceptors.add(Logging());

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio _dio) {
    return _dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options)! => requestInterceptor(options),
            onError: (DioError e) async {
              return e.response.data;
            }),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  static final _dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response?> getHTTP(String url) async {
    try {

      Response response = await baseAPI.get(url);
      return response;
    } on DioError catch (e) {
      // Handle error
    }
  }

  Future<Response?> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
    }
  }

  Future<Response?> patchHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.patch(url, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
    }
  }

  Future<Response?> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioError catch (e) {
      // Handle error
    }
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

*/

class DioClient {
  // TO DO: Get current user token here
  static String token = '726dad29ac2279a5001ed9b61baeebe1ab99fae3';
  Dio _dio = Dio();

  DioClient() {
    _dio = Dio(BaseOptions(
        baseUrl: Api.baseUrl,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        headers: {"Authorization": "Token $token"}));

    //  initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError e, ErrorInterceptorHandler handler) {
      print(e.message);
    }, onRequest: (options, handler) {
      print("Method: ${options.method}");
      print("URI: ${options.uri}");
      print("Data: ${options.data}");
    }, onResponse: (response, handler) {
      print(response.data);
    }));
  }

  Future<Response?> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<List<dynamic>?> getList(String endPoint) async {
    try {
      final response = await _dio.get(endPoint);
      print(response.data);
      return response.data.toString() as List;
    } on DioError catch (e) {
      print(e);
    }
  }
}
