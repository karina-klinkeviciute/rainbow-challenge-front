class regUser {
  String email;
  String password;
  String gender;
  String gender_other;
  // String username;
  String region;
  int year_of_birth;
  String re_password;
  //String is_lgbtqia;

  regUser({
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

  factory regUser.fromDatabaseJson(Map<String, dynamic> data) => regUser(
        email: data['email'],
        password: data['password'],
        gender: data['gender'],
        gender_other: data['gender_other'],
        // username: data['username'],
        region: data['region'],
        year_of_birth: data['year_of_birth'],
        re_password: data['re_password'],
        //is_lgbtqia: data['is_lgbtqia'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "email": this.email,
        "password": this.password,
        "gender": this.gender,
        "gender_other": this.gender_other,
        // "username": this.username,
        "region": this.region,
        "year_of_birth": this.year_of_birth,
        "re_password": this.re_password,
        //"is_lgbtqia": this.is_lgbtqia,
      };
}
