import 'dart:io';

import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';

class FilesRepository {
  final DioClient dioClient;
  FilesRepository({required this.dioClient});

  Future getFiles(String uuid) async {}

  Future uploadFile(File file, String uuid) async {
    var response =
        await dioClient.uploadFile(Api.fileUploadEndpoint, file, uuid);
    int i;
  }
}
