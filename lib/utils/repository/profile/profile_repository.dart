import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ProfileRepository {
  final DioClient dioClient;
  ProfileRepository({required this.dioClient});

  Future<Profile> fetchProfile() async {
    final profileRaw = await dioClient.getItem('/auth/users/me/');
    return Profile.fromJson(profileRaw!);
  }
}
