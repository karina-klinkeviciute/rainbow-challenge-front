import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesSupportRepository {
  final DioClient dioClient;
  ChallengesSupportRepository({required this.dioClient});

  Future<List<ChallengeSupport>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeSupportEndpoint);
    return challengesRaw!.map((e) => ChallengeSupport.fromJson(e)).toList();
  }

  Future<ChallengeSupport> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeSupportEndpoint;
    final String challengeTypePoint = '/api/challenge/support_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeSupport.fromJson(challengeRaw!);
  }

  Future<ChallengeSupport> fetchJoinedChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeCustomEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/support_joined_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeSupport.fromJson(challengeRaw!);
  }
}
