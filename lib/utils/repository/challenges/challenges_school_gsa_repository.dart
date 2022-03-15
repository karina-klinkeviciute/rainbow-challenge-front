import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesSchoolGsaRepository {
  final DioClient dioClient;
  ChallengesSchoolGsaRepository({required this.dioClient});

  Future<List<ChallengeSchoolGsa>> fetchChallenges() async {
    final challengesRaw =
        await dioClient.getList(Api.challengeSchoolGsaEndpoint);
    return challengesRaw!.map((e) => ChallengeSchoolGsa.fromJson(e)).toList();
  }

  Future<ChallengeSchoolGsa> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeSchoolGsaEndpoint;
    final String challengeTypePoint = '/api/challenge/school_gsa_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeSchoolGsa.fromJson(challengeRaw!);
  }

  Future<ChallengeSchoolGsa> fetchJoinedChallenge(
      {required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeSchoolGsaEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/school_gsa_joined_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeSchoolGsa.fromJson(challengeRaw!);
  }
}
