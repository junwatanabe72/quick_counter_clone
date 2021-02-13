import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_counter_clone/models/user.dart';

const baseUrl = "192.168.100.123:3000";
const prefix = "/users/";
Future<List<User>> getUsers(String mode) async {
  String _exchangeUserAttr(String mode) {
    final text = {
      "1-30": "first",
      "A-Z": "second",
      "a-z": "third",
    };
    return text[mode];
  }

  try {
    final response = await http.get(
      Uri.http(baseUrl, prefix + _exchangeUserAttr(mode)),
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
  String body = jsonEncode({"user": user.toMap()});
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
