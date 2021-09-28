import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rainbow_challenge/utils/model/api_model.dart';

final _base = "http://rainbowchallenge.lt:8000";
final _tokenEndpoint = "/auth/token/login/";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    // Changed syntax after updating the package (IS comment)
    Uri.parse(_tokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    //print('Logged: ' + response.body);
    //print('access token is -> ${json.decode(response.body)['auth_token']}');

//print(Token.fromJson(json.decode(response.body)));

    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
