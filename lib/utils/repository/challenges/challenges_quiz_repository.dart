import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_quiz/quiz_correct_answers_class.dart';
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
    // final String challengeTypePoint = Api.challengeQuizEndpoint;
    final String challengeTypePoint = '/api/challenge/quiz_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeQuiz.fromJson(challengeRaw!);
  }

  Future<ChallengeQuiz> fetchJoinedChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeCustomEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/quiz_joined_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeQuiz.fromJson(challengeRaw!);
  }

  Future<int> patchQuizChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeCustomEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/quiz_joined_challenge/$uuid/';
    Map<String, Object> body = {
      "main_joined_challenge": {
        "status": "completed",
      }
    };
    final challengeRaw = await dioClient.patchItem(challengeTypePoint, body);
    return ChallengeQuizCorrectAnswers.fromJson(challengeRaw!)
        .correct_answers_count;
  }

  fetchAnswer({required String uuid}) async {
    //https://rainbowchallenge.lt/api/joined_challenge/user_answer/
    // final String challengeTypePoint = Api.challengeQuizEndpoint;
    final String challengeTypePoint = '/api/joined_challenge/user_answer/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeQuiz.fromJson(challengeRaw!);
  }
}
