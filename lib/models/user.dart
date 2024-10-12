class User {
  String? id;
  String username;
  String password;
  String phoneNumber;
  String? avatarUrl;
  String? gender;
  String? dateOfBirth;

  User({
    this.id,
    required this.username,
    required this.password,
    required this.phoneNumber,
    this.avatarUrl,
    this.gender,
    this.dateOfBirth,
  });

  User copyWith({
    String? id,
    String? username,
    String? password,
    String? phoneNumber,
    String? avatarUrl,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
