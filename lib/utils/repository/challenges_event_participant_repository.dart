import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesEventParticipantRepository {
  final DioClient dioClient;
  ChallengesEventParticipantRepository({required this.dioClient});

  Future<List<ChallengeEventParticipant>> fetchChallenges() async {
    final challengesRaw =
        await dioClient.getList(Api.challengeEventParticipantEndpoint);
    return challengesRaw!
        .map((e) => ChallengeEventParticipant.fromJson(e))
        .toList();
  }

  Future<ChallengeEventParticipant> fetchChallenge(String uuid) async {
    final challengeRaw =
        await dioClient.getItem(Api.challengeEventParticipantEndpoint + uuid);
    return challengeRaw!.map((e) => ChallengeEventParticipant.fromJson(e));
  }
}
