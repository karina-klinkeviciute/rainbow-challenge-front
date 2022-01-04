import 'package:dio/dio.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/api_response.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class JoinedChallengesRepository {
  final DioClient dioClient;
  JoinedChallengesRepository({required this.dioClient});

  Future<ApiResponse<JoinedChallenge>> joinChallenge(
      {required String uuid, required String challengeType}) async {
    final challengeRaw = await dioClient
        .addItem('/api/joined_challenge/${challengeType}_joined_challenge/', {
      "main_joined_challenge": {"challenge": "${uuid}"}
    });

    if (challengeRaw.isNotEmpty && challengeRaw.keys.contains("_error")) {
      var error = challengeRaw["_error"] as DioError;
      var responseData = error.response?.data as List;
      var response = ApiResponse<JoinedChallenge>(
          null, false, responseData.first as String);
      return response;
    }

    if (challengeRaw.isNotEmpty && challengeRaw.keys.contains("_exception")) {
      var exception = challengeRaw["_exception"] as Exception;
      var response =
          ApiResponse<JoinedChallenge>(null, false, exception.toString());
      return response;
    }

    var joinedChallenge = JoinedChallenge.fromJson(challengeRaw);
    var response = ApiResponse<JoinedChallenge>(joinedChallenge, true, null);
    return response;
  }
}
