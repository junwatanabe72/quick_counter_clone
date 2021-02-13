import 'package:flutter/material.dart';
import 'package:quick_counter_clone/services/http/index.dart';
// import 'package:quick_counter_clone/services/http/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_counter_clone/db/index.dart';
import 'package:quick_counter_clone/models/user.dart';

class UserStore extends ChangeNotifier {
  User _user;
  List<User> _users = [];
  List<User> _globalUsers;
  User get user => _user;
  List<User> get users => _users;
  List<User> get globalUsers => _globalUsers;

  setUser(User user) {
    this._user = user;
    notifyListeners();
  }

  setUsers(List<User> users) {
    this._users = users;
    notifyListeners();
  }

  setGlobalUsers(List<User> users) {
    this._globalUsers = globalUsers;
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

  Future<List<User>> fetchGlobalUser(String mode) async {
    final fetchedUser = await getUsers(mode);
    print("async");
    print(fetchedUser);
    setGlobalUsers(fetchedUser);
    // return globalUsers;
    return fetchedUser;
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

  void updateUser(User user) async {
    await UserDatabase.db.updateUser(user);
    await postUsers(user);
    fetchUser(user.name);
    fetchUsers();
  }

  selectUpdateUserData(int currentNumber, int newNumber) {
    if (currentNumber == 0) {
      return newNumber;
    }
    if (currentNumber > newNumber) {
      return newNumber;
    }
    return currentNumber;
  }

  updateUserScore(String mode, int timeCount, bool isClear) {
    print(timeCount);
    if (!isClear) {
      return;
    }
    switch (mode) {
      case "1-30":
        _user.first = selectUpdateUserData(_user.first, timeCount);
        updateUser(_user);
        break;
      case "A-Z":
        _user.second = selectUpdateUserData(_user.second, timeCount);
        updateUser(_user);

        break;
      default:
        _user.third = selectUpdateUserData(_user.third, timeCount);
        updateUser(_user);
        break;
    }
  }
}
