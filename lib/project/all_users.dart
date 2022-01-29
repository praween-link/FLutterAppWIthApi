import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/project/user_profile.dart';

import 'colors.dart';
import 'controler.dart';
import 'drawer.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class Users extends StatelessWidget {
  static const routeName = '/users';
  const Users({Key? key}) : super(key: key);

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
                child: Image.asset('assets/img/menu_icon.png'),
              );
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
                height: 150,
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
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'All users',
                        style: TextStyle(
                          color: myColor.textColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
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
              for (var data in list!) {
                usersListData.add(data);
              }
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
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        backgroundColor:
                                            const Color(0xFFF9BE7C),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.blueGrey[200],
                                          backgroundImage: NetworkImage(
                                              '${usersListData[index]['avatar']}'),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${usersListData[index]['first_name']} ${usersListData[index]['last_name']}',
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            usersListData[index]['email'],
                                            style: TextStyle(
                                                color: myColor.subTextColor,
                                                fontSize: 16),
                                          ),
                                        ],
                                      )
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
