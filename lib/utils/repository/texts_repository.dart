import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/model/text/text_model_class.dart';

class TextsRepository {
  final DioClient dioClient;
  TextsRepository({required this.dioClient});

  Future<List<TextModel>> fetchTexts() async {
    final textsRaw = await dioClient.getList(Api.textsEndpoint);
    return textsRaw!.map((e) => TextModel.fromJson(e)).toList();
  }

  Future<TextModel> fetchText(String uuid) async {
    final textRaw = await dioClient.getItem("${Api.textsEndpoint}${uuid}/");
    return TextModel.fromJson(textRaw!);
  }
}
