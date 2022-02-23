import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesArticleRepository {
  final DioClient dioClient;
  ChallengesArticleRepository({required this.dioClient});

  Future<List<ChallengeArticle>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeArticleEndpoint);
    return challengesRaw!.map((e) => ChallengeArticle.fromJson(e)).toList();
  }

  Future<ChallengeArticle> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeArticleEndpoint;
    final String challengeTypePoint = '/api/challenge/article_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeArticle.fromJson(challengeRaw!);
  }

  Future<ChallengeArticle> fetchJoinedChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeArticleEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/article_joined_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeArticle.fromJson(challengeRaw!);
  }
}
