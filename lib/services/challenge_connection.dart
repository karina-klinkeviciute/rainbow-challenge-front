import 'dart:async';
import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rainbow_challenge/constants/api.dart' as Api;
import 'package:rainbow_challenge/utils/model/challenge_model.dart';

final _base = Api.baseUrl;
final _path = "/api/challenge/";
final _url = Uri.http(_base, _path);

class ChallengeService {
  Future<List<Challenge>> fetchChallenges() async {
    final response = await http.get(
      _url,
      headers: {
        'Authorization': 'Bearer TOKEN'
      },

      //  {
      //    HttpHeaders.authorizationHeader:
      //        'TOKEN',
      //  },
    );
    final responseJson = jsonDecode(response.body);
    final challengesJson = responseJson.map((json) => Challenge.fromJson(json));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return challengesJson;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load challenges');
    }
  }
}



/*
Future<Token> getToken(UserLogin userLogin) async {
  //print(_tokenURL);
  final http.Response response = await http.get(
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
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
*/