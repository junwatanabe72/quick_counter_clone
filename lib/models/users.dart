import 'package:renda_clone/models/user.dart';

class Users {
  final User user;
  Users({this.user});
  Map<String, dynamic> toMap() => {
        user.name: user,
      };
  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(user: User.fromMap(map['user']));
  }
}
