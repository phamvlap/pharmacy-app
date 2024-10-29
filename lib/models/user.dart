import 'dart:developer';

import '../../utils/utils.dart';

class User {
  String? id;
  String username;
  String phoneNumber;
  String? avatarUrl;
  Gender gender;
  String? dateOfBirth;

  User({
    this.id,
    required this.username,
    required this.phoneNumber,
    this.avatarUrl,
    this.gender = Gender.other,
    this.dateOfBirth,
  });

  User copyWith({
    String? id,
    String? username,
    String? phoneNumber,
    String? avatarUrl,
    Gender? gender,
    String? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl ?? '',
      'gender': gender.toString(),
      'dateOfBirth': dateOfBirth ?? '',
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      avatarUrl: json['avatarUrl'],
      gender: Gender.values.asNameMap()[json['gender'] ?? Gender.other.name]!,
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
