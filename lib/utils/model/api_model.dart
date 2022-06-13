class UserLogin {
  String email;
  String password;

  UserLogin({required this.email, required this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"email": this.email, "password": this.password};
}

class UserRegister {
  String email;
  String password;
  String gender;
  String gender_other;
  // String username;
  String region;
  int year_of_birth;
  String re_password;
  //String is_lgbtqia;

  UserRegister({
    required this.email,
    required this.password,
    required this.gender,
    required this.gender_other,
    // required this.username,
    required this.region,
    required this.year_of_birth,
    required this.re_password,
    //required this.is_lgbtqia
  });

  Map<String, dynamic> toDatabaseJson() => {
        "email": this.email,
        "password": this.password,
        "gender": this.gender,
        // "username": this.username,
        "gender_other": this.gender_other,
        "region": this.region,
        "year_of_birth": this.year_of_birth,
        "re_password": this.re_password,
        //"is_lgbtqia": this.is_lgbtqia
      };
}

class Token {
  String token;
  Token({required this.token});
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['auth_token']);
  }
}

class UserID {
  String uid;
  UserID({required this.uid});
  factory UserID.fromJson(Map<String, dynamic> json) {
    return UserID(uid: json['uid']);
  }
}
