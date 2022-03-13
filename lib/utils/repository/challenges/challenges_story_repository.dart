import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ChallengesStoryRepository {
  final DioClient dioClient;
  ChallengesStoryRepository({required this.dioClient});

  Future<List<ChallengeStory>> fetchChallenges() async {
    final challengesRaw = await dioClient.getList(Api.challengeStoryEndpoint);
    return challengesRaw!.map((e) => ChallengeStory.fromJson(e)).toList();
  }

  Future<ChallengeStory> fetchChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeStoryEndpoint;
    final String challengeTypePoint = '/api/challenge/story_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeStory.fromJson(challengeRaw!);
  }

  Future<ChallengeStory> fetchJoinedChallenge({required String uuid}) async {
    // BUG: Putting constant creates wrong URL. Should fix this later.
    //
    // final String challengeTypePoint = Api.challengeArticleEndpoint;
    final String challengeTypePoint =
        '/api/joined_challenge/story_joined_challenge/';
    final challengeRaw = await dioClient.getItem('$challengeTypePoint$uuid/');
    return ChallengeStory.fromJson(challengeRaw!);
  }
}
