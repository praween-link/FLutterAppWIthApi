import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Controller extends ChangeNotifier {
  
  Future<List> fetchUser() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      // return UserData.fromJson(jsonDecode(response.body)['data']);
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to read user data!');
    }
  }
}
