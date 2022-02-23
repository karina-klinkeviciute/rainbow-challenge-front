import 'dart:io';

import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/file_model.dart';

class FilesRepository {
  final DioClient dioClient;
  FilesRepository({required this.dioClient});

  Future<List<FileModel>> getFiles(String uuid, String challengeType) async {
    String endpoint = "${Api.fileListEndpoint}${challengeType}/${uuid}/";

    var response = await dioClient.getList(endpoint);
    if (response != null)
      return response.map((e) => FileModel.fromJson(e)).toList();
    return List<FileModel>.empty();
  }

  Future uploadFile(File file, String uuid, String challengeType) async {
    await dioClient.uploadFile(
        Api.fileUploadEndpoint, file, uuid, challengeType);
  }
}
