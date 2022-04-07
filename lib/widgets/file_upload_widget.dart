import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/file_model.dart';
import 'package:rainbow_challenge/utils/repository/files_repository.dart';

class FileUploadWidget extends StatefulWidget {
  String uuid;
  String challenge_type;

  FileUploadWidget({Key? key, required this.uuid, required this.challenge_type})
      : super(key: key);

  @override
  State<FileUploadWidget> createState() =>
      _FileUploadWidgetState(uuid: uuid, challenge_type: challenge_type);
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  FilesRepository filesRepository = FilesRepository(dioClient: DioClient());
  String uuid;
  String challenge_type;
  List<FileModel> files = new List<FileModel>.empty();

  _FileUploadWidgetState({required this.uuid, required this.challenge_type});

  @override
  void initState() {
    super.initState();
    loadFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getFileWidgets(files),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: onFileUploadPressed, child: Text("Pridėti failą"))
      ],
    );
  }

  Widget getFileWidgets(List<FileModel> files) {
    List<Widget> list = List<Widget>.empty(growable: true);
    for (var i = 0; i < files.length; i++) {
      list.add(new GestureDetector(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(files[i].file_name ?? "No name",
                style: TextStyle(
                    color: ThemeColors.secondaryColor, fontSize: 14))),
      ));
    }
    return new Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Future<void> onFileUploadPressed() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? "");
      await filesRepository.uploadFile(file, uuid, challenge_type);
      loadFiles();
    } else {
      // User canceled the picker
    }
  }

  Future loadFiles() async {
    var result = await filesRepository.getFiles(uuid, challenge_type);
    setState(() {
      files = result;
    });
  }
}
