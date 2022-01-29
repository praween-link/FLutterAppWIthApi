import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<UserData> fetchUser() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    return UserData.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception('Failed to read user data!');
  }
}

class UserData {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  UserData(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar']);
  }
}

class Users extends StatefulWidget {
  static const routeName = '/users';
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late Future<UserData> futureUserData;
  @override
  void initState() {
    super.initState();
    futureUserData = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: futureUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
