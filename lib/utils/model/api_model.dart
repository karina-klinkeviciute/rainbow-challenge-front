class UserLogin {
  String email;
  String password;

  UserLogin({required this.email, required this.password});

  Map <String, dynamic> toDatabaseJson() => {
    "email": this.email,
    "password": this.password
  };
}

class UserRegister {
  int year_of_birth;
  String email;
  String password;
  String re_password;

  UserRegister({required this.year_of_birth,required this.email, required this.password, required this.re_password});

  Map <String, dynamic> toDatabaseJson() => {
    "year_of_birth": this.year_of_birth,
    "email": this.email,
    "password": this.password,
    "re_password": this.re_password
  };
}

class Token{
  String token;

  Token({required this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['auth_token']
    );
  }
}