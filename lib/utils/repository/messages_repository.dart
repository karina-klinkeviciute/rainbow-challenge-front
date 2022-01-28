import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/message.dart';

class MessagesRepository {
  final DioClient dioClient;
  MessagesRepository({required this.dioClient});

  Future<List<Message>> fetchMessages() async {
    final messagesResponse = await dioClient.getList(Api.messagesEndpoint);
    return messagesResponse!.map((e) => Message.fromJson(e)).toList();
  }

  Future setSeen(String id) {
    var body = {"seen": true};
    return dioClient.updateItem("${Api.messagesEndpoint}${id}/", body);
  }
}
