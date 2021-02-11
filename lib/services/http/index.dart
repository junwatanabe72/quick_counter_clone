import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_counter_clone/models/user.dart';
import 'package:quick_counter_clone/util/var/index.dart';

const baseUrl = "192.168.100.123:3000";
const prefix = "/users/";
Future<List<User>> getUsers(String gameMode) async {
  String _exchangeUserAttr(String gameMode) {
    final text = {
      gameModes[mode.first.toString()]: mode.first
          .toString()
          .substring(mode.first.toString().indexOf('.') + 1),
      gameModes[mode.second.toString()]: mode.second
          .toString()
          .substring(mode.second.toString().indexOf('.') + 1),
      gameModes[mode.third.toString()]: mode.third
          .toString()
          .substring(mode.third.toString().indexOf('.') + 1),
    };
    return text[gameMode];
  }

  try {
    final response = await http.get(
      Uri.http(baseUrl, prefix + _exchangeUserAttr(gameMode)),
    );
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded["users"].map<User>((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("request failed");
    }
  } catch (e) {
    return [];
  }
}

Future<dynamic> postUsers(User user) async {
  Map<String, String> headers = {
    'content-type': 'application/json ; charset=UTF-8'
  };
  String body = jsonEncode({"user": user.toJson()});
  try {
    final response = await http.post(Uri.http(baseUrl, prefix),
        headers: headers, body: body);
    if (response.statusCode == 201) {
      final decoded = json.decode(response.body);
      return User.fromJson(decoded);
    } else {
      throw Exception("request failed");
    }
  } catch (e) {
    return "occured error";
  }
}
