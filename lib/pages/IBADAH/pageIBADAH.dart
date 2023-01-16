

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:schedule/pages/IBADAH/addIBADAH.dart';
import 'package:schedule/pages/IBADAH/dataIBADAH.dart';
import 'package:schedule/pages/IBADAH/dialogBoxIBADAH.dart';
import 'package:schedule/pages/home_page.dart';

class PageIBADAH extends StatefulWidget {
  const PageIBADAH({Key? key}) : super(key: key);

  @override
  State<PageIBADAH> createState() => _PageIBADAHState();
}

class _PageIBADAHState extends State<PageIBADAH> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOIBADAHLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

//text editing controller
  final _Tcontroller = TextEditingController();
  // final _Dcontroller = TextEditingController();

  //create task
  // List toDoList = [
  //   ["FYP chapter 2", false],
  //   ["do control audit", false],
  // ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoIbadahList[index][1] = !db.toDoIbadahList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoIbadahList.add([_Tcontroller.text, false]);
      _Tcontroller.clear(); // to clear whatever user just enter before

     
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: this.context,
      builder: (context) {
        return DialogBox(
          TitleController: _Tcontroller,
          // DescController: _Dcontroller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void reward() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Reward"),
        content: const Text("CONGRATULATIONS"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("okay"),
            ),
          ),
        ],
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoIbadahList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    // nav;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ibadah'),
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            _navigateToBackScreen(context);
          },
        ), //IconButton
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.mosque_rounded),
          ),
        ],
        //
      ),
      backgroundColor: Color.fromARGB(255, 220, 196, 224),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // backgroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        foregroundColor: Colors.white,
        onPressed: createNewTask,
      ),
      body: ListView.builder(
          itemCount: db.toDoIbadahList.length,
          itemBuilder: (context, index) {
            Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            );

            return AddIbadah(
              taskName: db.toDoIbadahList[index][0],
              // taskDescription: db.toDoList[index][0],
              taskCompleted: db.toDoIbadahList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }
          // children: [

          //   // AddTask(
          //   //   taskName: 'FYP',
          //   //   taskCompleted: true,
          //   //   onChanged: (p0) {},
          //   // ),
          //   // AddTask(
          //   //   taskName: 'Web development',
          //   //   taskCompleted: false,
          //   //   onChanged: (p0) {},
          //   // ),
          // ],
          ),
    );
  }

  void _navigateToBackScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
