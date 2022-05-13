import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

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
  String _token = "";
  Dio _dio = Dio();
  static String baseUrl = Api.baseUrl;

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      contentType: 'application/json', // Added contentType here
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ));

    //  initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (DioError e, ErrorInterceptorHandler handler) {
      print(e.message);
    }, onRequest: (options, handler) {
      print("Method: ${options.method}");
      print("URI: ${options.uri}");
      print("Data: ${options.data}");
    }, onResponse: (response, handler) {
      print(response.data);
    }));
  }
/*
  Future<Response?> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    print(response.data);
    return response;
  } */

  Future<List<dynamic>?> getList(String endPoint) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.get(endPoint);
      print(response.data);
      return response.data as List;
    } on DioError catch (e) {
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future<Map<String, dynamic>?> getItem(String endPoint) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.get(endPoint);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print('Error');
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future<Map<String, dynamic>> addItem(String endPoint, Map<String, dynamic> itemObject) async {
    print('adding ...');
    print(endPoint);
    print(itemObject);
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      print('results ${response.data}');
      return response.data;
    } on DioError catch (e) {
      print(e);
      return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
      return <String, dynamic>{"_exception": e};
    }
  }

  Future<Map<String, dynamic>> submitAnswer(String endPoint, Map<String, dynamic> itemObject) async {
    print('submitting answer...$itemObject');
    print(endPoint);
    print(itemObject);
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      print('results ${response.data}');
      return response.data;
    } on DioError catch (e) {
      print(e);
      return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception
      print('did not work, error is $e');
      //print('unhandled exception is $e');
      return <String, dynamic>{"_exception": e};
    }
  }

  Future<Map<String, dynamic>> completeQuizChallenge(
    String endPoint,
    var body,
  ) async {
    print('complete quiz data is $body');
    try {
      final challengeRaw = await _dio.patch(endPoint, data: body);
      print('results of complete quiz is ${challengeRaw.data}');
      return challengeRaw.data;
    } on DioError catch (e) {
      print(e);
      return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception
      print('did not work, error is $e');
      //print('unhandled exception is $e');
      return <String, dynamic>{"_exception": e};
    }
  }

  // Future<Map<String, dynamic>> completeQuiz(String endPoint, Map<String, dynamic> itemObject) async {
  //   print('completing quiz');
  //   print('item is $itemObject');
  //   try {
  //     await addAuthorizationHeader();
  //     final response = await _dio.post(endPoint, data: itemObject);
  //     print('results ${response.data}');
  //     return response.data;
  //   } on DioError catch (e) {
  //     print(e);
  //     return <String, dynamic>{"_error": e};
  //   } on Exception catch (e) {
  //     // Unhandled exception
  //     print('failed to complete quiz, error is $e');
  //     //print('unhandled exception is $e');
  //     return <String, dynamic>{"_exception": e};
  //   }
  // }

  Future<Map<String, dynamic>?> updateItem(String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.patch(endPoint, data: itemObject);
      print('Item updated ${response.data}');
      return response.data;
    } on DioError catch (e) {
      print(e);

      if (e.response?.data is Map<String, dynamic>) {
        Map<String, dynamic> dataMap = e.response?.data as Map<String, dynamic>;
        var errorMessagesList = dataMap.entries.first.value as List<dynamic>;
        return {"error": errorMessagesList.first};
      }
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future<Map<String, dynamic>?> removeItem(String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.delete(endPoint, data: itemObject);
      print('Item removed ${response.data}');
      return response.data;
    } on DioError catch (e) {
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future<Map<String, dynamic>?> uploadFile(String endPoint, File file, String uuid, String challengeType) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
        "concrete_joined_challenge_uuid": uuid,
        "challenge_type": challengeType
      });
      await addAuthorizationHeader();
      var response = await _dio.post(endPoint, data: formData);
      return response.data;
    } on DioError catch (e) {
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future<void> addAuthorizationHeader() async {
    String token = await _getAccessToken();
    _dio.options.headers = {"Authorization": "Token $token"};
  }

  Future<String> _getAccessToken() async {
    if (_token.isNotEmpty) return _token;

    var token = await UserRepository().getUserToken();
    if (token != null) _token = token;
    return _token;
  }
}
