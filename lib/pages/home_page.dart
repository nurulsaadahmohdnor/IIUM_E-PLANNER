// IIUM E-Planner [ Home page ]

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schedule/pages/CALENDAR/pageCALENDAR.dart';
import 'package:schedule/pages/IBADAH/pageIBADAH.dart';
import 'package:schedule/pages/SETTINGS/config.dart';
import 'package:schedule/pages/SETTINGS/pageHELP.dart';
import 'package:schedule/pages/TASK/fetchTASK.dart';
import 'package:schedule/pages/EXAM/fetchEXAM.dart';
import 'package:schedule/pages/SETTINGS/setting_page.dart';
import '../read data/task_column.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Get current user
  final user = FirebaseAuth.instance.currentUser!;

// document IDs
  List<String> docIDs = [];

//Variable for checklist
  bool _valu1 = false;
  bool _valu2 = false;
  bool _valu3 = false;
  bool _valu4 = false;

  @override
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          // color: Color.fromRGBO(81, 40, 85, 1),
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Color.fromRGBO(81, 40, 85, 1),
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

// Drawer for navigation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              color: Color.fromRGBO(81, 40, 85, 1),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
              indent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.school_rounded,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Exam",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pageEXAM()));
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
              indent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month_rounded,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Schedule",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pageCALENDAR()));
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
              indent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.task_alt_outlined,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Task",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pageTASK()));
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
              indent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.mosque_rounded,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Ibadah",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageIBADAH()));
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
              indent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
              indent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark_rounded,
                // color: Color.fromRGBO(81, 40, 85, 1),
              ),
              title: Text(
                "Help",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(81, 40, 85, 1),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pageHELP()));
              },
            ),
          ],
        ),
      ),

// App bar
      appBar: AppBar(
        title: Text('E-Planner'),
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        elevation: 0,

        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Icon(Icons.logout_rounded),
              )),
        ],
        //
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // ProfilePicture(
                //   name: user.email!,
                //   role: '',
                //   radius: 31,
                //   fontsize: 21,
                //   tooltip: true,
                // ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 65.0,
                  backgroundImage: AssetImage(
                    'assets/avatar-a-young-woman-in-a-hijab-muslim-vector-29662163-removebg-preview.png',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'W E L C O M E',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      user.email!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'IIUM Student',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            subheading('Quotes'),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width: 320,
                                height: 160,
                                padding: EdgeInsets.all(25),
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage(
                                      "assets/background-quote.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                        "Narrated Abu Huraira: Allah's Messenger (ﷺ) said, 'Whoever says, 'Subhan Allah wa bihamdihi,' one hundred times a day, will be forgiven all his sins even if they were as much as the foam of the sea. ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    color: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        subheading('Projects'),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: _valu1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _valu1 = value!;
                                  });
                                  if (_valu1) {
                                    // show dialog if check box is checked
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text('Congratulations!'),
                                        content: Wrap(
                                          children: [
                                            Text(
                                                'You have completed your TASK'),
                                            SizedBox(height: 40),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/5511415.png',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Accept'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pageTASK()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.task_alt_rounded,
                                iconBackgroundColor:
                                    Color.fromRGBO(81, 40, 85, 1),
                                title: 'Task',
                                subtitle: 'Check your task.',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: _valu2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _valu2 = value!;
                                  });
                                  if (_valu2) {
                                    // show dialog if check box is checked
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text('Congratulations!'),
                                        content: Wrap(
                                          children: [
                                            Text(
                                                'You have completed your EXAM'),
                                            SizedBox(height: 40),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/5511415.png',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Accept'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pageEXAM()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.school_rounded,
                                iconBackgroundColor:
                                    Color.fromRGBO(81, 40, 85, 1),
                                title: 'Exam',
                                subtitle: 'Check your exam.',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: _valu3,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _valu3 = value!;
                                  });
                                  if (_valu3) {
                                    // show dialog if check box is checked
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text('Congratulations!'),
                                        content: Wrap(
                                          children: [
                                            Text(
                                                'You have completed your SCHEDULE'),
                                            SizedBox(height: 40),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/5511415.png',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Accept'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pageCALENDAR()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.calendar_today_rounded,
                                iconBackgroundColor:
                                    Color.fromRGBO(81, 40, 85, 1),
                                title: 'Schedule',
                                subtitle: 'Check your schedule.',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Checkbox(
                                    activeColor: Colors.green,
                                    checkColor: Colors.white,
                                    value: _valu4,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _valu4 = value!;
                                      });
                                      if (_valu4) {
                                        // show dialog if check box is checked
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title:
                                                const Text('Congratulations!'),
                                            content: Wrap(
                                              children: [
                                                Text(
                                                    'You have completed your IBADAH'),
                                                SizedBox(height: 40),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/5511415.png',
                                                          height: 150,
                                                          width: 150,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Accept'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PageIBADAH()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.mosque_rounded,
                                iconBackgroundColor:
                                    Color.fromRGBO(81, 40, 85, 1),
                                title: 'Ibadah',
                                subtitle: 'Check your Ibadah.',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.dark_mode_rounded),
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        foregroundColor: Colors.white,
        onPressed: () {
          currentTheme.switchTheme();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => pageCALENDAR()),
          // );
        },
      ),
    );
  }
}
