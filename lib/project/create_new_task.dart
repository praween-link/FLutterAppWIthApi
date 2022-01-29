import 'package:flutter/material.dart';

import 'colors.dart';
import 'package:intl/intl.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class CreateNewTask extends StatefulWidget {
  static const routeName = '/createNewTask';
  const CreateNewTask({Key? key}) : super(key: key);

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  String selectedDate =
      DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()).toString();
  late TimeOfDay startTime;
  late TimeOfDay startPicked;
  late TimeOfDay endTime;
  late TimeOfDay endPicked;

  @override
  void initState() {
    super.initState();
    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
  }

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
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: myColor.textColor,
                  size: 45,
                ),
              );
            },
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: 280,
              width: w,
              decoration: const BoxDecoration(
                color: Color(0xFFF9BE7C),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Create new task',
                      style: TextStyle(
                        color: myColor.textColor,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: myFont.fontstyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 18.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Title'),
                        hintText: 'Enter title',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: ListTile(
                        title: const Text(
                          'Date',
                          style: TextStyle(color: Color(0xFF987147)),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  final selectedd = await _selectDate(context);
                                  setState(() {
                                    final DateFormat formatter =
                                        DateFormat('EEEE, dd MMMM yyyy');
                                    selectedDate = formatter.format(selectedd!);
                                  });
                                },
                                child: Text(
                                  selectedDate,
                                  style: TextStyle(
                                    color: myColor.textColor,
                                    fontSize: 18,
                                  ),
                                )),
                            const Divider(
                              thickness: 1,
                              color: Color(0xFF987147),
                            ),
                          ],
                        )),
                    trailing: GestureDetector(
                      onTap: () async {
                        final selectedd = await _selectDate(context);
                        setState(() {
                          final DateFormat formatter =
                              DateFormat('EEEE, dd MMMM yyyy');
                          selectedDate = formatter.format(selectedd!);
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFF309398),
                        radius: 30,
                        child: Icon(
                          Icons.date_range,
                          color: Colors.grey[200],
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _selectStartTime(context),
                    child: Column(
                      children: [
                        const Text(
                          'Start Time',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Text(
                              '${startTime.hour.toString()}:${startTime.minute.toString()}',
                              style: TextStyle(
                                color: myColor.textColor,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                                onPressed: () => _selectStartTime(context),
                                icon: const Icon(Icons.keyboard_arrow_down))
                          ],
                        ),
                        const Text(
                          '________________',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        // const Divider(
                        //   thickness: 1,
                        //   color: Colors.grey,
                        // ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectEndTime(context),
                    child: Column(
                      children: [
                        const Text(
                          'End Time',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Text(
                              '${endTime.hour.toString()}:${endTime.minute.toString()}',
                              style: TextStyle(
                                color: myColor.textColor,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                                onPressed: () => _selectEndTime(context),
                                icon: const Icon(Icons.keyboard_arrow_down))
                          ],
                        ),
                        const Text(
                          '________________',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        // const Divider(
                        //   thickness: 2,
                        //   color: Colors.grey,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, right: 18.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Description'),
                  hintText: 'Enter description',
                ),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: myFont.fontstyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('SPORT',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('MEDICAL APP',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('RENT APP',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('NOTES',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'GAMING PLATFORM APP',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),
                    ),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Button',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),
                    ),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Button',
                      style: TextStyle(
                          color: myColor.textColor,
                          fontFamily: myFont.fontstyle),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.blueGrey[200]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: const Text(
                    'Create Task',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
  Future<DateTime?> _selectStartTime(BuildContext context) async {
    startPicked =
        (await showTimePicker(context: context, initialTime: startTime))!;

    if (startPicked != null) {
      setState(() {
        startTime = startPicked;
      });
    }
  }

  Future<DateTime?> _selectEndTime(BuildContext context) async {
    endPicked = (await showTimePicker(context: context, initialTime: endTime))!;

    if (endPicked != null) {
      setState(() {
        endTime = endPicked;
      });
    }
  }
}
