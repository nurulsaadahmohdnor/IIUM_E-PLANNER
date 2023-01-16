import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:schedule/pages/EXAM/fetchEXAM.dart';
import 'package:schedule/pages/PROFILE/fetchPROFILE.dart';
import 'package:schedule/pages/TASK/fetchTASK.dart';

class InsertPROFILE extends StatefulWidget {
  const InsertPROFILE({Key? key}) : super(key: key);

  @override
  State<InsertPROFILE> createState() => _InsertPROFILEState();
}

class _InsertPROFILEState extends State<InsertPROFILE> {
  final userIDController = TextEditingController();
  final emailProfileController = TextEditingController();
  final nameProfileController = TextEditingController();
  final matricNoProfileController = TextEditingController();

 

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
  }

  TimeOfDay Ttime = TimeOfDay(hour: 10, minute: 30);
  final user = FirebaseAuth.instance.currentUser!;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Add Profile',
                      style: TextStyle(
                        color: Color.fromRGBO(81, 40, 85, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          user.email!,
                          // controller: emailProfileController,
                          style: TextStyle(
                            color: Color.fromRGBO(81, 40, 85, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          // controller: emailProfileController,

                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Name',
                              hintText: 'Enter your name'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: matricNoProfileController,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Matric No',
                              hintText: 'Enter your matric number'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      splashColor: Colors.green,
                      hoverColor: Colors.green,
                      color: Color.fromRGBO(81, 40, 85, 1),
                      onPressed: () {
                        Map<String, String> students = {
                          'userID': userIDController.text = user.uid,
                          'name': nameProfileController.text,
                          'matricNo': matricNoProfileController.text,
                          'email': emailProfileController.text = user.email!,
                        };

                        dbRef.push().set(students);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => pagePROFILE()));
                      },
                      child: const Text('Save Profile'),
                      textColor: Colors.white,
                      minWidth: 300,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    MaterialButton(
                      splashColor: Colors.red,
                      hoverColor: Colors.red,
                      color: Color.fromRGBO(81, 40, 85, 1),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => pagePROFILE()));
                      },
                      child: const Text('Cancel'),
                      textColor: Colors.white,
                      minWidth: 200,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
