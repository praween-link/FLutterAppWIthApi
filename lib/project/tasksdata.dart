import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/project/task.dart';

import 'colors.dart';
import 'controler.dart';
import 'create_new_task.dart';
import 'drawer.dart';
import 'home_screen.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class TasksData extends StatelessWidget {
  static const routeName = '/taskData';
  const TasksData(
      {Key? key,
      required this.userid,
      required this.username,
      required this.userprofileimage})
      : super(key: key);
  final String userid;
  final String username;
  final String userprofileimage;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Controller>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    print('Hello Google!');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9BE7C),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(Icons.format_align_left, color: Color(0xFF0D243E),),
              );
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateNewTask())),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/data/tasks.json'),
          builder: (context, snapshot) {
            // return Text(userData.length.toString());
            // return ListView.builder(
            //   itemCount: userData.length,
            //   itemBuilder: (context, int index) {
            //   return ListTile(title: Text(DefaultAssetBundle.of(context).loadString('assets/data/tasks.json').toString()),);
            // });

            //
            if (snapshot.hasData) {
              var allUserData = json.decode(snapshot.data.toString());
              var userData = allUserData[userid];
              //
              int taskDone = 0;
              int taskProgress = 0;
              int taskNew = 0;

              List<Task> tasksList = [];

              for (var data in userData) {
                if (data['status'] == 'new') {
                  taskNew++;
                } else if (data['status'] == 'progress') {
                  taskProgress++;
                } else {
                  taskDone++;
                }
                //
                Task _task = Task(
                    title: data['title'],
                    date: data['date'],
                    starttime: data['start_time'],
                    endtime: data['end_time'],
                    description: data['description'],
                    category: data['category'],
                    status: data['status'],
                    proccess: data['proccess']);
                tasksList.add(_task);
              }
              //
              return ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _profileImage(),
                          const SizedBox(width: 20),
                          _profileDetails(),
                        ],
                      ),
                    ),
                  ),
                  HomeScreen(
                    noNew: taskNew,
                    noProgress: taskProgress,
                    noDone: taskDone,
                    tasksList: tasksList,
                  ),
                ],
              );
              // return
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  //
  _profileDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          username,
          style: TextStyle(
            color: myColor.textColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w900,
            fontFamily: myFont.fontstyle,
          ),
        ),
        Text(
          'App Developer',
          style: TextStyle(
            color: myColor.subTextColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w100,
            fontFamily: myFont.fontstyle,
          ),
        ),
      ],
    );
  }

  _profileImage() {
    return CircleAvatar(
      radius: 48,
      backgroundColor: const Color(0xFFE46471),
      child: CircleAvatar(
        radius: 42,
        // backgroundColor: Color(0xFF594c69),
        backgroundColor: const Color(0xFFF9BE7C),
        child: CircleAvatar(
          radius: 36,
          backgroundImage: NetworkImage(userprofileimage),
        ),
      ),
    );
  }
}
