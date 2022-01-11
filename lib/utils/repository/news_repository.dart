import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class NewsRepository {
  final DioClient dioClient;
  NewsRepository({required this.dioClient});

  Future<List<News>> fetchNews() async {
    final newsRaw = await dioClient.getList(Api.newsEndpoint);
    return newsRaw!.map((e) => News.fromJson(e)).toList();
  }
}
