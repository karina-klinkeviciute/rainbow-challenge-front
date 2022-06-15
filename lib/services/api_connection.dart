import 'dart:async';
import 'dart:convert';
//import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rainbow_challenge/utils/model/api_model.dart';

final _base = "https://rainbowchallenge.lt";
final _tokenEndpoint = "/auth/token/login/";
final _tokenURL = _base + _tokenEndpoint;
final _registerURL = _base + "/auth/users/";
final _recoveryEmailURL = _base + "/auth/users/reset_password/";

Future<Token> getToken(UserLogin userLogin) async {
  //print(_tokenURL);
  final http.Response response = await http.post(
    Uri.parse(_tokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    //print('access token is -> ${json.decode(response.body)['auth_token']}');
    return Token.fromJson(json.decode(response.body));
  } else {
    //print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<String?> createUser(UserRegister userRegister) async {
  final http.Response response = await http.post(
    Uri.parse(_registerURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(userRegister.toDatabaseJson()),
  );

  final jsonString = response.body.toString();
  Map<String, dynamic> msg = jsonDecode(jsonString);

  if (response.statusCode == 201) return null;

  return msg.entries.first.value.toString();
}

Future<String?> createUserRecoveryEmail(
    UserRecoveryEmail userRecoveryEmail) async {
  final http.Response response = await http.post(
    Uri.parse(_recoveryEmailURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(userRecoveryEmail.toDatabaseJson()),
  );

  final jsonString = response.body.toString();
  Map<String, dynamic> msg = jsonDecode(jsonString);

  if (response.statusCode == 201) return null;

  return msg.entries.first.value.toString();
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() {
    return message;
  }
}
