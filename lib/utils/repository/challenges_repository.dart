import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesRepository with ChallengesMixin {
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
