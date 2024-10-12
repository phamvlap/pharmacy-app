import './../models/models.dart';

class UserController {
  final List<User> _users = [
    User(
      id: '1',
      username: 'test',
      password: 'test123',
      phoneNumber: '0123456789',
    )
  ];

  void addUser(User user) {
    _users.add(
      user.copyWith(
        id: (_users.length + 1).toString(),
      ),
    );
  }
}
