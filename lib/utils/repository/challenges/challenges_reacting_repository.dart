import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesReactingRepository {
  final DioClient dioClient;
  ChallengesReactingRepository({required this.dioClient});

  Future<List<ChallengeReacting>> fetchChallenges() async {
    final challengesRaw =
        await dioClient.getList(Api.challengeReactingEndpoint);
    return challengesRaw!.map((e) => ChallengeReacting.fromJson(e)).toList();
  }

  Future<ChallengeReacting> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeReactingEndpoint;
    final String challengeTypePoint = '/api/challenge/reacting_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeReacting.fromJson(challengeRaw!);
  }

  Future<ChallengeReacting> fetchJoinedChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeReactingEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/reacting_joined_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeReacting.fromJson(challengeRaw!);
  }
}
