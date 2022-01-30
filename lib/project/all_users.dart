import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/project/tasksdata.dart';
import 'package:todolist/project/user_profile.dart';

import 'colors.dart';
import 'controler.dart';
import 'drawer.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class Users extends StatefulWidget {
  static const routeName = '/users';
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<Map<String, dynamic>> listData = [];
  String key = '';
  bool searching = false;


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Controller>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9BE7C),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.format_align_left,
                  color: Color(0xFF0D243E),
                ),
              );
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => setState(() {
              searching = !searching;
            }),
            // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewTask())),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: FutureBuilder(
          future: provider.fetchUser(),
          builder: (context, snapshot) {
            List usersListData = [
              Container(
                height: searching ? 180 : 130,
                width: w,
                decoration: const BoxDecoration(
                  color: Color(0xFFF9BE7C),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searching ? Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            key = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Search user",
                          label: Text("Search user"),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ) : const Text(''),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, right: 18.0, top: searching ? 18:8, bottom: searching ? 0:14),
                      child: Text(
                        'All users',
                        style: TextStyle(
                          color: myColor.textColor,
                          fontSize: searching ? 25.0 : 30.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: myFont.fontstyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 38.0, right: 18.0, top: 8, bottom: searching ? 0:14),
                      child: Text(
                        'List of all users!',
                        style: TextStyle(
                          color: myColor.subTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: myFont.fontstyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
            if (snapshot.hasData) {
              List? list = snapshot.data as List?;
              listData = [];
              for (var data in list!) {
                // usersListData.add(data);
                listData.add(data);
              }
              usersListData.addAll(key.isEmpty
                  ? listData
                  : listData
                      .where((user) => user["first_name"]
                          .toLowerCase()
                          .contains(key.toLowerCase()))
                      .toList());
              return ListView.builder(
                  itemCount: usersListData.length,
                  itemBuilder: (context, int index) {
                    return index == 0
                        ? usersListData[index]
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
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
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 32,
                                              backgroundColor:
                                                  const Color(0xFFF9BE7C),
                                              child: GestureDetector(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserProfile(
                                                      userid:
                                                          usersListData[index]
                                                              ['id'],
                                                      username:
                                                          '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                                      useremail:
                                                          usersListData[index]
                                                              ['email'],
                                                      userprofileimage:
                                                          usersListData[index]
                                                              ['avatar'],
                                                    ),
                                                  ),
                                                ),
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor:
                                                      Colors.blueGrey[200],
                                                  backgroundImage: NetworkImage(
                                                      '${usersListData[index]['avatar']}'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  usersListData[index]['email'],
                                                  style: TextStyle(
                                                      color:
                                                          myColor.subTextColor,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 25.0),
                                          child: Column(
                                            children: [
                                              IconButton(
                                                onPressed: () =>
                                                    showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        ListTile(
                                                          trailing: const Icon(
                                                              Icons.task),
                                                          title: const Text(
                                                              'View Tasks'),
                                                          onTap: () =>
                                                              Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      TasksData(
                                                                userid: usersListData[
                                                                            index]
                                                                        ['id']
                                                                    .toString(),
                                                                username:
                                                                    '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                                                userprofileimage:
                                                                    usersListData[
                                                                            index]
                                                                        [
                                                                        'avatar'],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        ListTile(
                                                          trailing: const Icon(
                                                              Icons
                                                                  .account_circle),
                                                          title: const Text(
                                                              'Profile'),
                                                          onTap: () =>
                                                              Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      UserProfile(
                                                                userid:
                                                                    usersListData[
                                                                            index]
                                                                        ['id'],
                                                                username:
                                                                    '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                                                useremail:
                                                                    usersListData[
                                                                            index]
                                                                        [
                                                                        'email'],
                                                                userprofileimage:
                                                                    usersListData[
                                                                            index]
                                                                        [
                                                                        'avatar'],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        ListTile(
                                                          trailing: const Icon(
                                                              Icons.delete),
                                                          title: const Text(
                                                              'Delete'),
                                                          onTap: () {},
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                icon: const Icon(
                                                    Icons.more_vert_outlined),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }),
      drawer: const MyDrawer(),
    );
  }
}

//
//
class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
