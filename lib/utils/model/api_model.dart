class UserLogin {
  String email;
  String password;

  UserLogin({this.email, this.password});

  Map <String, dynamic> toDatabaseJson() => {
    "email": this.email,
    "password": this.password
  };
}

class Token{
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token']
    );
  }
}

