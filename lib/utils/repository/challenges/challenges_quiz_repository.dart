import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesQuizRepository {
  final DioClient dioClient;
  ChallengesQuizRepository({required this.dioClient});

  Future<List<ChallengeQuiz>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeQuizEndpoint);
    return challengesRaw!.map((e) => ChallengeQuiz.fromJson(e)).toList();
  }

  Future<ChallengeQuiz> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    print('uuid is $uuid');
    //final String challengeTypePoint = Api.challengeQuizEndpoint;
    final String challengeTypePoint = '/api/challenge/quiz_challenge/$uuid';
    print('ep is $challengeTypePoint');
    final challengeRaw = await dioClient.getItem(challengeTypePoint);
    //final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    print('raw is $challengeRaw');
    return ChallengeQuiz.fromJson(challengeRaw!);
  }
}
