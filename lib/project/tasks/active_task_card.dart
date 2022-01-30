import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todolist/project/tasks/view_task.dart';

import '../colors.dart';
import 'task.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class ActiveTaskCard extends StatelessWidget {
  const ActiveTaskCard({Key? key, required this.task,
      required this.username,
      required this.userprofileimage}) : super(key: key);

  final Task task;
  final String username;
  final String userprofileimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewTask(task: task, username: username, userprofileimage: userprofileimage,))),
        child: Container(
          height: 300,
          // width: 165,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 6.0,
                animation: true,
                percent: task.proccess / 100,
                center: Text(
                  "${task.proccess}.0%",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.white,
                backgroundColor: task.status == 'new'
                    ? const Color(0xFFE77481)
                    : task.status == 'done'
                        ? const Color(0xFF8DA4E1)
                        : const Color(0xFF449DA1),
              ),
              Column(
                children: [
                  Text(
                    task.category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: myFont.fontstyle,
                    ),
                  ),
                  Text(
                    '9 hours progress',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w100,
                      fontFamily: myFont.fontstyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
          decoration: BoxDecoration(
            color: task.status == 'new'
                ? const Color(0xFFE46371)
                : task.status == 'done'
                    ? const Color(0xFF6588E4)
                    : const Color(0xFF309398),
            borderRadius: const BorderRadius.all(
              Radius.circular(45),
            ),
          ),
        ),
      ),
    );
  }
}
