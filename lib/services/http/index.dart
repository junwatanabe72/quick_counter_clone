import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_counter_clone/models/user.dart';

const baseUrl = 'http://localhost:3000/users/';

Future<List<User>> getUsers(String mode) async {
  String _exchangeUserAttr(String mode) {
    final text = {
      "1-30": "first",
      "A-Z": "second",
      "a-z": "third",
    };
    return text[mode];
  }

  final requestUrl = baseUrl + _exchangeUserAttr(mode);
  try {
    final response = await http.get(
      requestUrl,
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded["users"].map<User>((user) => User.fromJson(user)).toList();
    } else {
      return [];
      // throw Exception("request failed");
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
    final response = await http.post(Uri.http('@localhost:3000', '/users'),
        headers: headers, body: body);
    if (response.statusCode == 201) {
      final decoded = json.decode(response.body);
      return User.fromJson(decoded);
    } else {
      return;
      // throw Exception("request failed");
    }
  } catch (e) {
    return;
  }
}
