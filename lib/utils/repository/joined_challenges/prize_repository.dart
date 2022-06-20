import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';

class PrizeRepository {
  final DioClient dioClient;
  PrizeRepository({required this.dioClient});

  Future<List<Prize>> fetchPrize() async {
    final prizes = await dioClient.getList(Api.prizesEndpoint);
    return prizes!.map((e) => Prize.fromJson(e)).toList();
  }
}
