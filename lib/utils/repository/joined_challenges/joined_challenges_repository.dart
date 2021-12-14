import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class JoinedChallengesRepository {
  final DioClient dioClient;
  JoinedChallengesRepository({required this.dioClient});

  Future<JoinedChallenge?> joinChallenge(
      {required String uuid, required String challengeType}) async {
    final challengeRaw = await dioClient
        .addItem('/api/joined_challenge/${challengeType}_joined_challenge/', {
      "main_joined_challenge": {"challenge": "${uuid}"}
    });

    if (challengeRaw == null) return null;

    return JoinedChallenge.fromJson(challengeRaw);
  }
}
