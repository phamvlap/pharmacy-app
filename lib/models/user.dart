class User {
  String username;
  String password;
  String? phoneNumber;
  String? avatarUrl;

  User({
    required this.username,
    required this.password,
    this.phoneNumber,
    this.avatarUrl,
  });
}
