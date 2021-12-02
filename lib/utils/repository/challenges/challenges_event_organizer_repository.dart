import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesEventOrganizerRepository {
  final DioClient dioClient;
  ChallengesEventOrganizerRepository({required this.dioClient});

  Future<List<ChallengeEventOrganizer>> fetchChallenges() async {
    final challengesRaw =
        await dioClient.getList(Api.challengeEventOrganizerEndpoint);
    return challengesRaw!
        .map((e) => ChallengeEventOrganizer.fromJson(e))
        .toList();
  }

  Future<ChallengeEventOrganizer> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeEventOrganizerEndpoint;
    final String challengeTypePoint =
        '/api/challenge/event_organizer_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeEventOrganizer.fromJson(challengeRaw!);
  }
}

mixin JoinChallengeMixin {
  DioClient get dioClient;
  Future<Challenge> joinChallenge(
      {required String uuid, required String challengeType}) async {
    final challengeRaw = await dioClient
        .addItem('/api/challenge/joined_challenge/${challengeType}/', {});
    return Challenge.fromJson(challengeRaw!);
  }
}
