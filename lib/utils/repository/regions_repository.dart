import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class RegionsRepository {
  final DioClient dioClient;
  RegionsRepository({required this.dioClient});

  Future<List<RegionModel>> fetchRegions() async {
    final regionsRaw = await dioClient.getList(Api.regionsEndpoint);
    return regionsRaw!.map((e) => RegionModel.fromJson(e)).toList();
  }
}
