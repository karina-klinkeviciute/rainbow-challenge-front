
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

class ProfileRepository {
  final DioClient dioClient;
  ProfileRepository({required this.dioClient});

  Future<Profile> fetchProfile() async {
    final profileRaw = await dioClient.getItem('/auth/users/me/');
    return Profile.fromJson(profileRaw!);
  }
    Future<RainbowBalance> fetchRainbowBalance() async {
    final profileRaw = await dioClient.getItem('/api/results/balance/');
    return RainbowBalance.fromJson(profileRaw!);
  }
}
