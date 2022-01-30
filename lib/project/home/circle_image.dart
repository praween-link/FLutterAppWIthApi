import 'package:flutter/material.dart';
import 'package:todolist/project/user_profile/user_profile.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.usersListData,
    required this.index,
  }) : super(key: key);

  final List usersListData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: const Color(0xFFF9BE7C),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfile(
              userid: usersListData[index]['id'],
              username:
                  '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
              useremail: usersListData[index]['email'],
              userprofileimage: usersListData[index]['avatar'],
            ),
          ),
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueGrey[200],
          backgroundImage: NetworkImage('${usersListData[index]['avatar']}'),
        ),
      ),
    );
  }
}