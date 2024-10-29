import 'package:pocketbase/pocketbase.dart';
import 'dart:developer';

import '../models/user.dart';
import './pocketbase_client.dart';
import '../utils/utils.dart';

class AuthService {
  void Function(User? user)? onAuthChange;

  AuthService({
    this.onAuthChange,
  }) {
    if (onAuthChange != null) {
      getPocketBase().then((pocketBase) {
        pocketBase.authStore.onChange.listen((event) {
          onAuthChange!((event.model == null)
              ? null
              : User.fromJson(event.model.toJson()));
        });
      });
    }
  }

  Future<User> register(
      String username, String password, String phoneNumber) async {
    final pb = await getPocketBase();
    try {
      final record = await pb.collection('users').create(
        body: {
          'username': username,
          'password': password,
          'passwordConfirm': password,
          'phoneNumber': phoneNumber,
          'gender': Gender.other.name,
        },
      );
      return User.fromJson(record.toJson());
    } catch (error) {
      if (error is ClientException) {
        throw Exception(error.response['message']);
      }
      throw Exception('An error occurred');
    }
  }

  Future<User> login(String username, String password) async {
    final pb = await getPocketBase();
    try {
      final authRecord = await pb.collection('users').authWithPassword(
            username,
            password,
          );
      return User.fromJson(authRecord.record!.toJson());
    } catch (error) {
      log('Error login user: $error');
      if (error is ClientException) {
        throw Exception(error.response['message']);
      }
      throw Exception('An error occurred');
    }
  }

  Future<void> logout() async {
    final pb = await getPocketBase();
    pb.authStore.clear();
  }

  Future<User?> getUserFromStore() async {
    final pb = await getPocketBase();
    final model = pb.authStore.model;

    if (model == null) {
      return null;
    }
    return User.fromJson(model.toJson());
  }
}
