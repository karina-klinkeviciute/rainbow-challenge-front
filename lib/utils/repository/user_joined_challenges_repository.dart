import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class UserJoinedChallengesRepository {
  final DioClient dioClient;
  UserJoinedChallengesRepository({required this.dioClient});

  Future<List<UserJoinedChallenge>> fetchChallenges() async {
    final userJoinedChallengeRaw =
        await dioClient.getList(Api.userJoinedChallengesEndpoint);
    return userJoinedChallengeRaw!
        .map((e) => UserJoinedChallenge.fromJson(e))
        .toList();
  }
}
