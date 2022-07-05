import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/joined_challenge/joined_challenge_event_participant/joined_challenge_event_participant_class.dart';

class JoinedChallengesEventParticipantRepository {
  final DioClient dioClient;
  JoinedChallengesEventParticipantRepository({required this.dioClient});

  Future<JoinedChallengeEventParticipant> completeChallenge(
      {required String uuid, required String qr_code}) async {
    Api api = Api();
    final challengeType = api.getChallengeTypeSubPath(Api.challengeTypeEvent);

    final challengeRaw = await dioClient.updateItem(
        '/api/joined_challenge/${challengeType}_joined_challenge/${uuid}/', {
      "main_joined_challenge": {
        "status": "completed",
      },
      "qr_code": "${qr_code}"
    });
    return JoinedChallengeEventParticipant.fromJson(challengeRaw!);
  }

  Future<String> scanChallenge({required String qr_code}) async {
    Api api = Api();
    final endPoint = '/api/qr_code_scan/';

    final response =
        await dioClient.getQrCode(endPoint, {"qr_code": "${qr_code}"});
    return response;
  }
}
