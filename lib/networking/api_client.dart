import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bloc_tutorial/models/barrel.dart';

class UserApiClient {
  Future<List<User>> getUsers() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      // print(json);
      return json.map((i) => User.fromJson(i)).toList();
    } else {
      throw Exception('error getting users data');
    }
  }
}
