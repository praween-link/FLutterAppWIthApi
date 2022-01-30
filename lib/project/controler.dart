import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Controller extends ChangeNotifier {
  // List<dynamic> alltasks = [];

  // Future<List> fetchAllTasks(BuildContext context) async {
  //   final response = await DefaultAssetBundle.of(context)
  //       .loadString('assets/data/tasks.json');
  //   final alltask = await json.decode(response);
  //   alltasks = alltask['1'];
  //   // notifyListeners();
  //   return json.decode(response)['1'];
  // }

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
