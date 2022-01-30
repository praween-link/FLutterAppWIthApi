import 'package:flutter/material.dart';

import 'colors.dart';
import 'drawer.dart';

MyColor myColor = MyColor();
MyFont myFont = MyFont();

class UserProfile extends StatelessWidget {
  static const routeName = '/userprofile';
  const UserProfile(
      {Key? key,
      required this.userid,
      required this.username,
      required this.useremail,
      required this.userprofileimage})
      : super(key: key);

  final int userid;
  final String username;
  final String useremail;
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
                child: const Icon(Icons.format_align_left, color: Color(0xFF0D243E),),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
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
            //////////
            UserDetails(userid: userid, username: username, useremail: useremail),
          ],
        ),
        ],),
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

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key, required this.userid, required this.username, required this.useremail})
      : super(key: key);
  final int userid;
  final String username;
  final String useremail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                userid.toString(),
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              leading: Icon(
                Icons.perm_identity_sharp,
                color: myColor.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                username,
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              leading: Icon(
                Icons.account_circle,
                color: myColor.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                useremail,
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              leading: Icon(
                Icons.email,
                color: myColor.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                '+91 8507766280',
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              leading: Icon(
                Icons.phone,
                color: myColor.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                'Banglore',
                style: TextStyle(
                  color: myColor.textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: myFont.fontstyle,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: myColor.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
