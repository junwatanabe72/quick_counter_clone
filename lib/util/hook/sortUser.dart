import 'package:quick_counter_clone/models/user.dart';

List<User> sortUsers(List<User> users, String gameMode) {
  final targetUsers = [...users];

  List<User> cutUsers(List<User> baseUsers) {
    const number = 10;
    if (baseUsers.length > number) {
      final cutUser = [...baseUsers]..removeRange(number, baseUsers.length);
      return cutUser;
    }
    return baseUsers;
  }

  switch (gameMode) {
    case "1-30":
      final excluededNewUsers =
          targetUsers.where((user) => user.first != 0).toList();
      excluededNewUsers.sort((a, b) => a.first.compareTo(b.first));
      return cutUsers(excluededNewUsers);
      break;
    case "A-Z":
      final excluededNewUsers =
          targetUsers.where((user) => user.second != 0).toList();
      excluededNewUsers.sort((a, b) => a.second.compareTo(b.second));
      return cutUsers(excluededNewUsers);
      break;
    default:
      final excluededNewUsers =
          targetUsers.where((user) => user.third != 0).toList();
      excluededNewUsers.sort((a, b) => a.third.compareTo(b.third));
      return cutUsers(excluededNewUsers);
      break;
  }
}
