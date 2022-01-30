import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../colors.dart';
import '../drawer/drawer.dart';
import 'task.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class ViewTask extends StatelessWidget {
  static const routeName = '/viewTask';
  const ViewTask(
      {Key? key,
      required this.task,
      required this.username,
      required this.userprofileimage})
      : super(key: key);

  final Task task;
  final String username;
  final String userprofileimage;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _profileImage(),
                              const SizedBox(width: 20),
                              _profileDetails(),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            task.date,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              fontFamily: myFont.fontstyle,
                            ),
                          ),
                        ],
                      )),
                ),
                //////////
                _taskdetails(context),
              ],
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  _taskdetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                task.title,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          //
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        task.starttime,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End Time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        task.endtime,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Text(
            'Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                task.category,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          //
          const SizedBox(height: 12),

          const Text(
            'Status',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 12.0, right: 28.0, left: 38.0),
              child: Column(
                children: [
                  CircularPercentIndicator(
                      radius: 45.0,
                      lineWidth: 6.0,
                      animation: true,
                      percent: task.proccess / 100,
                      center: Text(
                        "${task.proccess}.0%",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0,
                          color: Colors.purple[900],
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: task.status == 'new'
                          ? const Color(0xFFE77481)
                          : task.status == 'done'
                              ? const Color(0xFF8DA4E1)
                              : const Color(0xFF449DA1),
                      backgroundColor: const Color(0xffc5c5c7)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      task.status=='done' ? 'Completed task!' : task.status=='new' ? 'New task!' : 'In process!',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )),

          const SizedBox(height: 8.0),

          const Text(
            'Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                task.description,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          //
        ],
      ),
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
