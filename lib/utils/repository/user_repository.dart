import 'dart:async';
import 'package:rainbow_challenge/utils/model/user_model.dart';
import 'package:rainbow_challenge/utils/model/api_model.dart';
import 'package:rainbow_challenge/services/api_connection.dart';
import 'package:rainbow_challenge/utils/dao/user_dao.dart';

class UserRepository {

  final userDao = UserDao();

  Future<User> authenticate ({
    required String email,
    required String password
  }) async {
    UserLogin userLogin = UserLogin(
        email: email,
        password: password
    );

    Token token = await getToken(userLogin);

    User user = User(
      id: 0,
      email: email,
      token: token.token,
    );
    return user;
  }

  Future<User> register ({
    required int year_of_birth,
    required String email,
    required String password,
    required String re_password
  }) async {
    UserRegister userReg = UserRegister(
        year_of_birth: year_of_birth,
        email: email,
        password: password,
        re_password: re_password,
    );

    Token token = await setUser(userReg);

    User user = User(
      id: 0,
      email: email,
      token: token.token,
    );
    return user;
  }

  Future<void> persistToken ({
    required User user
  }) async {
    // write token with the user to the database
    await userDao.createUser(user);
  }

  Future <void> deleteToken({
    required int id
  }) async {
    await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }

  Future<String?> getUserToken() async {
    String? result = await userDao.getUserToken();
    return result;
  }

}