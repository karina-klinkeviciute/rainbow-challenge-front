import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/file_model.dart';
import 'package:rainbow_challenge/utils/repository/files_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  bool error = false;
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
            onPressed: onFileUploadPressed,
            child: Text("${AppLocalizations.of(context)!.attach_file} (Max 20MB)")),
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
      try {
        await filesRepository.uploadFile(file, uuid, challenge_type);
      } catch (e) {
        _msg(context);
      }
      loadFiles();
    } else {}
  }
  // Future<Response?> getRequest(String endPoint) async {
  //   Response response;
  //   try {
  //     response = await _dio.get(endPoint);
  //   } on DioError catch (e) {
  //     print(e.message);
  //     throw Exception(e.message);
  //   }
  //   print(response.data);
  //   return response;
  // }

  Future loadFiles() async {
    var result = await filesRepository.getFiles(uuid, challenge_type);

    setState(() {
      files = result;
    });
  }

  void _msg(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        AppLocalizations.of(context)!.files_too_big,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent,
    ));
  }
}
