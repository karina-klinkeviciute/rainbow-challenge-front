import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/utils/model/api_model.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_quiz/quiz_correct_answers_class.dart';
import 'package:rainbow_challenge/utils/model/quiz/correct_answer.dart';
import 'package:rainbow_challenge/utils/model/reg_user_model.dart';
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
  Future<String> getAccessToken() async {
    if (_token.isNotEmpty) return _token;

    var token = await UserRepository().getUserToken();
    if (token != null) _token = token;
    return _token;
  }

  String _token = "";
  Dio _dio = Dio();
  static String baseUrl = Api.baseUrl;

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      contentType: 'application/json', // Added contentType here
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ));

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
    print(response.data);
    return response;
  }

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
      return <String, dynamic>{"_exception": e};
    } on Exception catch (e) {
      // Unhandled exception

      print(e);
      return <String, dynamic>{"_exception": e};
    }
  }

  Future<Map<String, dynamic>> addItem(
      String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      print('Item added ${response.data}');
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

  Future<Response> postPrize(
      String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      print('Prize claimed ${response}');
      return response;
    } on DioError catch (e) {
      print(e.response);
      throw e.response?.data.values;
      // return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception

      print(e);
      throw Exception(e);
      // return <String, dynamic>{"_exception": e};
    }
  }

  Future<String> getAnswer(
      String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      print('Prize claimed ${response}');
      return CorrectAnswer.fromJson(response.data).correctAnswer.uuid;
    } on DioError catch (e) {
      print(e.response);
      throw e.response?.data.values;
      // return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception

      print(e);
      throw Exception(e);
      // return <String, dynamic>{"_exception": e};
    }
  }

  Future<String?> getQrCode(
      String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      print('Prize claimed ${response}');
      if (response.statusCode == 201) {
        return 'Užduotis atlikta';
      }
      return response.statusMessage;
    } on DioError catch (e) {
      print(e.response);
      throw e.response?.data.values;
      // return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception

      print(e);
      throw Exception(e);
      // return <String, dynamic>{"_exception": e};
    }
  }

  Future<RegUser> getUser(String endPoint) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.get(endPoint);
      print('Prize claimed ${response}');
      return RegUser.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response);
      throw e.response?.data.values;
      // return <String, dynamic>{"_error": e};
    } on Exception catch (e) {
      // Unhandled exception

      print(e);
      throw Exception(e);
      // return <String, dynamic>{"_exception": e};
    }
  }

  Future<Map<String, dynamic>?> updateItem(
      String endPoint, Map<String, dynamic> itemObject) async {
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

  patchItem(String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.patch(endPoint, data: itemObject);
      print('Item updated ${response.data}');
      return ChallengeQuizCorrectAnswers.fromJson(response.data)
          .correct_answers_count;
    } on DioError catch (e) {
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  patchUser(String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.patch(endPoint, data: itemObject);
      print(response.statusMessage);
      print("Data sent: $itemObject");
      print("User updated $response.data");
      return response.statusMessage;
    } on DioError catch (e) {
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  deleteUser(String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.delete(endPoint, data: itemObject);
      print("Status message: ${response.statusMessage}");
      print("Data sent: $itemObject");
      print("User info: ${response.data}");
      return response.statusMessage;
    } on DioError catch (e) {
      print(e);
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future sendRePassword(
      String endPoint, Map<String, dynamic> itemObject) async {
    try {
      await addAuthorizationHeader();
      final response = await _dio.post(endPoint, data: itemObject);
      return response.data;
    } on DioError catch (e) {
      print(e);

      if (e.response?.data is Map<String, dynamic>) {
        Map<String, dynamic> dataMap = e.response?.data as Map<String, dynamic>;
        ;
        return dataMap.toString();
      }
    } on Exception catch (e) {
      // Unhandled exception
      print(e);
    }
  }

  Future<Map<String, dynamic>?> removeItem(
      String endPoint, Map<String, dynamic> itemObject) async {
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

  Future<Map<String, dynamic>?> uploadFile(
      String endPoint, File file, String uuid, String challengeType) async {
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
      print('222');
      // print(e);
      throw (e);
    } on Exception catch (e) {
      print('333');
      print(e);
    }
  }

  Future<void> addAuthorizationHeader() async {
    String token = await _getAccessToken();
    _dio.options.headers = {"Authorization": "Token $token"};
  }

  Future<String?> registerFCMToken({required dynamic endPoint, required dynamic itemObject}) async {
    try {
      await addAuthorizationHeader();
      
      print("Sending FCM token to Backend ${endPoint}");
      final response = await _dio.post(endPoint, data: itemObject);

      print("FCM token sent to Backend! Response: ${response.statusMessage}");

      return response.statusMessage; 
    } on DioError catch (e) {
      print(e);
      print(e.response);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<String> getGoogleOauthAuthorizationUrl() async {
    final String endpoint = Api.googleOauthFlowInitial;

    String _returnUrl = "Error: Could not get authorization_url";

    try {
      final response = await _dio.get(endpoint);

      final resCode = response.statusCode;

      print(response.statusCode);
      print(response.data["authorization_url"] as String);

      if(resCode == 200){
        // TODO: extract authorization_url from data received
        _returnUrl = response.data["authorization_url"] as String;
      }
    }on DioError catch(err){
      print("Sent request to: $endpoint");
      throw err;
    }
    
    return _returnUrl;
  }

  Future<String> _getAccessToken() async {
    if (_token.isNotEmpty) return _token;

    var token = await UserRepository().getUserToken();
    if (token != null) _token = token;
    return _token;
  }
}