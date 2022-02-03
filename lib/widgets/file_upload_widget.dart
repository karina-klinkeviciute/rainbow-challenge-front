import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/repository/files_repository.dart';

class FileUploadWidget extends StatefulWidget {
  String uuid;

  FileUploadWidget({Key? key, required this.uuid}) : super(key: key);

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState(uuid: uuid);
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  FilesRepository filesRepository = FilesRepository(dioClient: DioClient());
  String uuid;

  _FileUploadWidgetState({required this.uuid});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("File upload widget"),
        ElevatedButton(
            onPressed: onFileUploadPressed, child: Text("Pridėti failą"))
      ],
    );
  }

  Future<void> onFileUploadPressed() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? "");
      await filesRepository.uploadFile(file, uuid);
    } else {
      // User canceled the picker
    }
  }
}
