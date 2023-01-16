import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:schedule/pages/EXAM/insertEXAM.dart';
import 'package:schedule/pages/EXAM/updateEXAM.dart';
import 'package:schedule/pages/PROFILE/insertPROFILE.dart';
import 'package:schedule/pages/PROFILE/updatePROFILE.dart';
import 'package:schedule/pages/TASK/insertTASK.dart';
import 'package:schedule/pages/TASK/updateTASK.dart';

class pagePROFILE extends StatefulWidget {
  const pagePROFILE({Key? key}) : super(key: key);

  @override
  State<pagePROFILE> createState() => _pagePROFILEState();
}

class _pagePROFILEState extends State<pagePROFILE> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Students');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Students');

  Widget listItem({required Map student}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    student['name'],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Color.fromARGB(255, 220, 196, 224),
                ),
                margin: const EdgeInsets.all(20),
                // padding: const EdgeInsets.all(30),
                padding:
                    const EdgeInsets.only(left: 30.0, bottom: 0.5, right: 20.0),
                height: 140,
                // color: Color.fromARGB(255, 220, 196, 224),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      student['name'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      student['email'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      student['matricNo'],
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UpdatePROFILE(
                                        studentKey: student['key'])));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            reference.child(student['key']).remove();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red[700],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(81, 40, 85, 1),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => InsertPROFILE(),
              ),
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          title: const Text('P R O F I L E'),

           actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.mosque_rounded),
          ),
        ],
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map student = snapshot.value as Map;
              student['key'] = snapshot.key;

              return listItem(student: student);
            },
          ),
        ));
  }
}
