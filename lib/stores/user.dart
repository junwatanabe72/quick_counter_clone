import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:renda_clone/db/index.dart';
import 'package:renda_clone/models/user.dart';

class UserStore extends ChangeNotifier {
  User _user;
  List<User> _users = [];
  User get user => _user;
  List<User> get users => _users;

  setUser(User user) {
    this._user = user;
    notifyListeners();
  }

  setUsers(List<User> users) {
    this._users = users;
    notifyListeners();
  }

  setInitalData(User user, List<User> users) {
    setUser(user);
    setUsers(users);
  }

  static void setCurrentUser(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

// dbからデータをfetchして_usersを作成
  void fetchUsers() async {
    List<User> users;
    users = await UserDatabase.db.getFullUsers();
    setUsers(users);
  }

// dbからデータをfetchしてcurrentUserを作成
  void fetchUser(String name) async {
    final user = await UserDatabase.db.getUsersByName(name);
    setCurrentUser(user.name);
    setUser(user);
  }

// dbにユーザーを登録する
  void addNewUser({String name}) async {
    await UserDatabase.db
        .addToDatabase(User(name: name, first: 0, second: 0, third: 0));
    fetchUser(name);
    fetchUsers();
  }

  createUser(String name) async {
    if (name.length == 0) {
      _user = null;
      setCurrentUser("");
      // UserDatabase.db.deleteAll();
      notifyListeners();
      return;
    }
    User user = await UserDatabase.db.getUsersByName(name);
    if (user != null) {
      _user = user;
      notifyListeners();
      return;
    }
    addNewUser(name: name);
    return;
  }

  List<User> sortUsers(String gameMode) {
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
      case "10S":
        targetUsers.sort((a, b) => b.first.compareTo(a.first));
        return cutUsers(targetUsers);
        break;
      case "60S":
        targetUsers.sort((a, b) => b.second.compareTo(a.second));
        return cutUsers(targetUsers);
        break;
      default:
        targetUsers.sort((a, b) => b.third.compareTo(a.third));
        return cutUsers(targetUsers);
        break;
    }
  }

  void updateUser(User user) async {
    await UserDatabase.db.updateUser(user);
    fetchUser(user.name);
    fetchUsers();
  }

  updateUserScore(String mode, int count, bool timeUp) {
    switch (mode) {
      case "10S":
        if (!timeUp) {
          return;
        }
        _user.first = _user.first > count ? _user.first : count;
        updateUser(_user);
        break;
      case "60S":
        if (!timeUp) {
          return;
        }
        _user.second = _user.second > count ? _user.second : count;
        updateUser(_user);

        break;
      default:
        if (count == 0) {
          return;
        }
        _user.third = count;
        updateUser(_user);
        break;
    }
  }
}
