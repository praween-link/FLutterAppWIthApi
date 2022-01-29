import 'package:flutter/material.dart';
import 'package:todolist/project/create_new_task.dart';
import 'package:todolist/project/home_screen.dart';

import 'all_users.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              // image: AssetImage("assets/gold.jpg"),
              //    fit: BoxFit.cover
              image: NetworkImage(
                  'https://image.freepik.com/free-vector/gradient-abstract-background-design_52683-70291.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(''),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.group),
          title: const Text('All users'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Users(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_align_left),
          title: const Text('Create Task'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateNewTask(),
              ),
            );
          },
        ),
      ],
    ),
    );
  }
}
