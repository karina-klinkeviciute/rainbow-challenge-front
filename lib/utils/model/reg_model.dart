class regUser {
  int year_of_birth;
  String email;
  String password;
  String re_password;
  //String gender;
  //String gender_other;
  //String username;
  //String region;
  //String is_lgbtqia;

  regUser({
    required this.year_of_birth,
    required this.email,
    required this.password,
    required this.re_password,
    //required this.gender,
    //required this.gender_other,
    //required this.username,
    //required this.region,
    //required this.is_lgbtqia
  });

  factory regUser.fromDatabaseJson(Map<String, dynamic> data) => regUser(
    year_of_birth: data['year_of_birth'],
    email: data['email'],
    password: data['password'],
    re_password: data['re_password'],
    //gender: data['gender'],
    //gender_other: data['gender_other'],
    //username: data['username'],
    //region: data['region'],
    //is_lgbtqia: data['is_lgbtqia'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    //"year_of_birth": this.year_of_birth,
    "email": this.email,
    "password": this.password,
    "re_password": this.re_password,
    //"gender": this.gender,
    //"gender_other": this.gender_other,
    //"username": this.username,
    //"region": this.region,
    //"is_lgbtqia": this.is_lgbtqia,

  };
}