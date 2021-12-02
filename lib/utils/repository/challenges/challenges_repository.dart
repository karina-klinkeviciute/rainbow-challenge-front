import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesRepository with ChallengesMixin, ChallengeMixin {
  final DioClient dioClient;
  ChallengesRepository({required this.dioClient});
}

mixin ChallengesMixin {
  DioClient get dioClient;
  Future<List<Challenge>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeEndpoint);
    return challengesRaw!.map((e) => Challenge.fromJson(e)).toList();
  }
}

mixin ChallengeMixin {
  DioClient get dioClient;
  Future<Challenge> fetchChallenge({required String uuid}) async {
    final challengeRaw =
        await dioClient.getItem('/api/challenge/challenge/${uuid}/');
    return Challenge.fromJson(challengeRaw!);
  }
}
