import 'dart:async';
import 'dart:convert';
//import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rainbow_challenge/utils/model/api_model.dart';

final _base = "https://rainbowchallenge.lt";
final _tokenEndpoint = "/auth/token/login/";
final _tokenURL = _base + _tokenEndpoint;
final _registerURL = _base + "/auth/users/";

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

Future<bool> createUser(UserRegister userRegister) async {

  final http.Response response = await http.post(
    Uri.parse(_registerURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(userRegister.toDatabaseJson()),
  );

  final jsonString = response.body.toString();
  Map<String, dynamic> msg = jsonDecode(jsonString);

  String _msg = 'Klaida:${msg['uid']} ${msg['email']} ${msg['auth_token']} ${msg['password']} ${msg['re_password']} ${msg['gender']}';

  /*
  String _patchURL = _registerURL + "${msg['uid']}/";
  final http.Response responsePatch = await http.patch(
    Uri.parse(_patchURL),
    body:  jsonEncode({
      "gender": 'man',
      "region": 'fb48c6cf-6a2d-41e3-9c2f-b9e4b1048f10'
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token ${msg['auth_token']}',
    },
    //body: jsonEncode(userRegister.toDatabaseJson()),
  );
  */

  print(response.statusCode);

  if (response.statusCode == 201) {

    print(UserID.fromJson(json.decode(response.body)));

    return true;

  } else {
    throw HttpException(_msg);
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() {
    return message;
  }
}