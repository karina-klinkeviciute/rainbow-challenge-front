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

  Future<ChallengeEventParticipant> fetchChallenge(
      {required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    Api api = Api();
    final challengeType = api.getChallengeTypeSubPath(Api.challengeTypeEvent);
    final challengeRaw = await dioClient
        .getItem('/api/challenge/event_participant_challenge/$uuid/');
    return ChallengeEventParticipant.fromJson(challengeRaw!);
  }
}
