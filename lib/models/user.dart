class User {
  String username;
  String password;
  String phoneNumber;
  String? avatarUrl;
  String? gender;
  String? dateOfBirth;

  User({
    required this.username,
    required this.password,
    required this.phoneNumber,
    this.avatarUrl,
    this.gender,
    this.dateOfBirth,
  });
}
