import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';

class ChallengesRepository {
  final DioClient dioClient;
  ChallengesRepository({required this.dioClient});

  Future<List<Challenge>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengesEndpoint);
    return challengesRaw!.map((e) => Challenge.fromJson(e)).toList();
  }
}
