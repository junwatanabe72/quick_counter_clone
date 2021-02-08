import 'package:quick_counter_clone/db/index.dart';
import 'package:quick_counter_clone/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Object>> Function() getIntialData = () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final name = prefs.getString('name');
  final User user = await UserDatabase.db.getUsersByName(name);
  final List<User> users = await UserDatabase.db.getFullUsers();
  return {"user": user, "users": users};
};
