import 'dart:async';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/user_model.dart';
import 'package:rainbow_challenge/utils/model/reg_model.dart';
import 'package:rainbow_challenge/utils/model/api_model.dart';
import 'package:rainbow_challenge/services/api_connection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final _reSetPasswordURL =
      "https://rainbowchallenge.lt" + "/auth/users/set_password/";
  final String _userAccessTokenKey = "userAccessToken";
  final storage = new FlutterSecureStorage();

  Future<User> authenticate(
      {required String email, required String password}) async {
    UserLogin userLogin = UserLogin(email: email, password: password);

    Token token = await getToken(userLogin);

    User user = User(
      id: 0,
      email: email,
      token: token.token,
    );
    return user;
  }

  Future<String> register({
    required String email,
    required String password,
    required String gender,
    required String gender_other,
    // required String username,
    required String region,
    required int year_of_birth,
    required String re_password,
    //required String is_lgbtqia
  }) async {
    UserRegister userReg = UserRegister(
      email: email,
      password: password,
      re_password: re_password,
      gender: gender,
      gender_other: gender_other,
      // username: username,
      year_of_birth: year_of_birth,
      region: region,
      //is_lgbtqia: is_lgbtqia,
    );

    var errorMessage = await createUser(userReg);

    // regUser reguser = regUser(
    //   email: email,
    //   password: password,
    //   gender: gender,
    //   gender_other: gender_other,
    //   // username: username,
    //   region: region,
    //   year_of_birth: year_of_birth,
    //   re_password: re_password,
    //   //is_lgbtqia: is_lgbtqia
    // );

    return errorMessage ?? "";
  }

  Future<String> registerRecoveryEmail({
    required String email_recovery,
  }) async {
    UserRecoveryEmail userRecoveryEmail = UserRecoveryEmail(
      email_recovery: email_recovery,
    );
    var errorMessage = await createUserRecoveryEmail(userRecoveryEmail);
    return errorMessage ?? "";
  }

  Future<String?> registerReSetPassword({
    required String current_password,
    required String new_password,
    required String re_new_password,
  }) async {
    DioClient dio = DioClient();
    UserReSetPassword userReSetPassword = UserReSetPassword(
        current_password: current_password,
        new_password: new_password,
        re_new_password: re_new_password);
    var errorMessage = await dio.postPrize(
        _reSetPasswordURL, userReSetPassword.toDatabaseJson());

    return errorMessage.data;
  }

  Future<void> persistToken({required User user}) {
    return storage.write(key: _userAccessTokenKey, value: user.token);
  }

  Future<void> deleteToken({required int id}) {
    return storage.delete(key: _userAccessTokenKey);
  }

  Future<bool> hasToken() async {
    return await getUserToken() != null;
  }

  Future<String?> getUserToken() {
    return storage.read(key: _userAccessTokenKey);
  }
}
