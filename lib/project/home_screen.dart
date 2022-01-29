import 'package:flutter/material.dart';
import 'package:todolist/project/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todolist/project/create_new_task.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class HomeScreen extends StatelessWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewTask())),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListView(
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
            // Bottom
            _bottomTopBar(),
            _tasksList(),

            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 8.0, top: 8.0),
              child: Text(
                'Active Projects',
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
                children: [
                  _activeProject(context),
                  _activeProject(context),
                  _activeProject(context),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }

  _activeProject(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
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
              percent: 0.7,
              center: const Text(
                "70.0%",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.white,
              backgroundColor: const Color(0xFF449DA1),
            ),
            Column(
              children: [
                Text(
                  'Medical App',
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
        decoration: const BoxDecoration(
          color: Color(0xFF309398),
          borderRadius: BorderRadius.all(
            Radius.circular(45),
          ),
        ),
      ),
    );
  }

  //
  _tasksList() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 8.0, top: 8.0),
      child: Column(
        children: [
          _task(),
          _task(),
          _task(),
        ],
      ),
    );
  }

  _task() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            child: Icon(Icons.watch_later_outlined),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To Do',
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              Text(
                '5 tasks now. 1 started',
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

//
  _profileDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Khushi Kumari',
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
    return const CircleAvatar(
      radius: 48,
      backgroundColor: Color(0xFFE46471),
      child: CircleAvatar(
        radius: 42,
        // backgroundColor: Color(0xFF594c69),
        backgroundColor: Color(0xFFF9BE7C),
        child: CircleAvatar(
          radius: 36,
          backgroundImage: AssetImage('assets/img/girl.jpg'),
        ),
      ),
    );
  }
}
