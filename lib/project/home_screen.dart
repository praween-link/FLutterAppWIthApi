import 'package:flutter/material.dart';
import 'package:todolist/project/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todolist/project/create_new_task.dart';

import 'active_task_card.dart';
import 'drawer.dart';
import 'task.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class HomeScreen extends StatelessWidget {
  static const routeName = '/homeScreen';
  const HomeScreen(
      {Key? key,
      required this.noNew,
      required this.noProgress,
      required this.noDone,
      required this.tasksList})
      : super(key: key);

  final int noDone;
  final int noProgress;
  final int noNew;
  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    List<Widget> myActiveTasks = [];
    for (var data in tasksList) {
      myActiveTasks.add(ActiveTaskCard(task: data));
    }
    print(myActiveTasks);
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        // Bottom
        _bottomTopBar(),
        _tasksList(),

        Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, bottom: 8.0, top: 8.0),
          child: Text(
            'Active Tasks',
            style: TextStyle(
              color: myColor.textColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
              fontFamily: myFont.fontstyle,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 9.0, right: 9.0),
          child: GridView.count(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: myActiveTasks,
          ),
        ),
      ],
    );
  }

  // _activeProject(BuildContext context) {
  //   return
  // }

  //
  _tasksList() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 8.0, top: 8.0),
      child: Column(
        children: [
          _task('New', noNew, const Color(0xFFE46371)),
          _task('In Progress', noProgress, const Color(0xFF309398)),
          _task('Done', noDone, const Color(0xFF6588E4)),
        ],
      ),
    );
  }

  _task(String title, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 25,
            child: const Icon(Icons.watch_later_outlined),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              Text(
                '$count ${count <= 1 ? 'task' : 'tasks'} now.',
                style: TextStyle(
                  color: myColor.subTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w100,
                  fontFamily: myFont.fontstyle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _bottomTopBar() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 8.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Tasks',
            style: TextStyle(
              color: myColor.textColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
              fontFamily: myFont.fontstyle,
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFF309398),
            radius: 30,
            child: Icon(
              Icons.date_range,
              color: Colors.grey[200],
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
