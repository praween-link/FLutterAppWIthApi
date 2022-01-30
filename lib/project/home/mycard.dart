import 'package:flutter/material.dart';
import 'package:todolist/project/colors.dart';
import 'package:todolist/project/tasks/tasksdata.dart';
import 'package:todolist/project/user_profile/user_profile.dart';

import 'circle_image.dart';
MyColor myColor = MyColor();

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.usersListData, required this.index})
      : super(key: key);

  final List usersListData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleImage(
                    usersListData: usersListData,
                    index: index,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        usersListData[index]['email'],
                        style: TextStyle(
                            color: myColor.subTextColor, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Column(
                            children: [
                              ListTile(
                                trailing: const Icon(Icons.task),
                                title: const Text('View Tasks'),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TasksData(
                                      userid:
                                          usersListData[index]['id'].toString(),
                                      username:
                                          '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                      userprofileimage: usersListData[index]
                                          ['avatar'],
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                trailing: const Icon(Icons.account_circle),
                                title: const Text('Profile'),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserProfile(
                                      userid: usersListData[index]['id'],
                                      username:
                                          '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                      useremail: usersListData[index]['email'],
                                      userprofileimage: usersListData[index]
                                          ['avatar'],
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                trailing: const Icon(Icons.delete),
                                title: const Text('Delete'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.more_vert_outlined),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
