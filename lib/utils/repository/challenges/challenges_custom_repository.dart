import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesCustomRepository {
  final DioClient dioClient;
  ChallengesCustomRepository({required this.dioClient});

  Future<List<ChallengeCustom>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeCustomEndpoint);
    return challengesRaw!.map((e) => ChallengeCustom.fromJson(e)).toList();
  }

  Future<ChallengeCustom> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeCustomEndpoint;
    final String challengeTypePoint = '/api/challenge/custom_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeCustom.fromJson(challengeRaw!);
  }
}
