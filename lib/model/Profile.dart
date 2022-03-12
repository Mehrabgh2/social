class Profile {
  String? mobile;
  String? email;
  String? username;
  String? name;
  String? surname;
  String? tel;
  String? description;
  String? avatar;
  String? type;
  String? city;
  String? province;
  String? country;
  String? timezone;
  String? balance;

  Profile(
      {required this.mobile,
      required this.email,
      required this.username,
      required this.name,
      required this.surname,
      required this.tel,
      required this.description,
      required this.avatar,
      required this.type,
      required this.city,
      required this.province,
      required this.country,
      required this.timezone,
      required this.balance});

  Profile.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    email = json['email'];
    username = json['username'];
    name = json['name'];
    surname = json['surname'];
    tel = json['tel'];
    description = json['description'];
    avatar = json['avatar'];
    type = json['type'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
    timezone = json['timezone'];
    balance = json['balance'];
  }
}
