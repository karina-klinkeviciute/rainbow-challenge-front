import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class JoinedChallengesEventParticipantRepository {
  final DioClient dioClient;
  JoinedChallengesEventParticipantRepository({required this.dioClient});

  Future<JoinedChallengeEventParticipant> completeChallenge(
      {required String uuid, required String qr_code}) async {
    Api api = Api();
    final challengeType = api.getChallengeTypeSubPath(Api.challengeTypeEvent);
    final challengeRaw = await dioClient.updateItem(
        '/api/joined_challenge/${challengeType}_joined_challenge/', {
      "main_joined_challenge": {
        "challenge": "${uuid}",
        "status": "completed",
      },
      "qr_code": "${qr_code}"
    });
    return JoinedChallengeEventParticipant.fromJson(challengeRaw!);
  }
}
