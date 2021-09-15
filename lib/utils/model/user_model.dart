class User {
  int id;
  String email;
  String token;

  User(
      {this.id,
      this.email,
      this.token});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      id: data['id'],
      email: data['email'],
      token: data['token'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "email": this.email,
        "token": this.token
      };
}
