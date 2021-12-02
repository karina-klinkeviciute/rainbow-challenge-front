import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesProjectRepository {
  final DioClient dioClient;
  ChallengesProjectRepository({required this.dioClient});

  Future<List<ChallengeProject>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeProjectEndpoint);
    return challengesRaw!.map((e) => ChallengeProject.fromJson(e)).toList();
  }

  Future<ChallengeProject> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeProjectEndpoint;
    final String challengeTypePoint = '/api/challenge/project_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeProject.fromJson(challengeRaw!);
  }
}
