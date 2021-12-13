import 'dart:async';
import 'package:rainbow_challenge/utils/model/user_model.dart';
import 'package:rainbow_challenge/utils/model/reg_model.dart';
import 'package:rainbow_challenge/utils/model/api_model.dart';
import 'package:rainbow_challenge/services/api_connection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
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

  Future<regUser> register({
    required int year_of_birth,
    required String email,
    required String password,
    required String re_password,
    //required String gender,
    //required String gender_other,
    //required String username,
    //required String region,
    //required String is_lgbtqia
  }) async {
    UserRegister userReg = UserRegister(
      year_of_birth: year_of_birth,
      email: email,
      password: password,
      re_password: re_password,
      //gender: gender,
      //gender_other: gender_other,
      //username: username,
      //region: region,
      //is_lgbtqia: is_lgbtqia,
    );

    await createUser(userReg);

    regUser reguser = regUser(
      year_of_birth: year_of_birth,
      email: email,
      password: password,
      re_password: re_password,
      //gender: gender,
      //gender_other: gender_other,
      //username: username,
      //region: region,
      //is_lgbtqia: is_lgbtqia
    );
    return reguser;
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
