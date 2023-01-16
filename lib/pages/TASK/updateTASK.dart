import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule/pages/EXAM/fetchEXAM.dart';
import 'package:schedule/pages/TASK/fetchTASK.dart';

class UpdateTASK extends StatefulWidget {
  const UpdateTASK({Key? key, required this.taskKey}) : super(key: key);

  final String taskKey;

  @override
  State<UpdateTASK> createState() => _UpdateTASKState();
}

class _UpdateTASKState extends State<UpdateTASK> {
  final userIDController = TextEditingController();
  final titleTaskController = TextEditingController();
  final descTaskController = TextEditingController();
  final timeTaskController = TextEditingController();
  final dateTaskController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Tasks');
    getExamData();
  }

  TimeOfDay Ttime = TimeOfDay(hour: 10, minute: 30);
  final user = FirebaseAuth.instance.currentUser!;
  DateTime dateTime = DateTime.now();

  void getExamData() async {
    DataSnapshot snapshot = await dbRef.child(widget.taskKey).get();

    Map task = snapshot.value as Map;

    userIDController.text = task['userID'];
    titleTaskController.text = task['title'];
    descTaskController.text = task['desc'];
    dateTaskController.text = task['date'];
    timeTaskController.text = task['time'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
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
                      'Edit Task',
                      style: TextStyle(
                        // color: Color.fromRGBO(81, 40, 85, 1),
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
                        child: TextField(
                          controller: titleTaskController,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Title',
                              hintText: 'Enter title'),
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
                          controller: descTaskController,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Description',
                              hintText: 'Enter description'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // SingleChildScrollView(
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        child: TextFormField(
                          controller: dateTaskController,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Due Date',
                            hintText: 'Choose date',
                            suffixIcon: Icon(
                              Icons.calendar_month,
                            ),
                          ),

                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickeddate != null) {
                              setState(() {
                                // date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                                dateTaskController.text =
                                    DateFormat('E | d MMM yyyy')
                                        .format(pickeddate);
                                // date.text =
                                //     DateFormat('EEEE, MMM d, yyyy').format(pickeddate);
                                // date.text = DateFormat.yMMMEd().format(pickeddate);
                              });
                            }
                          },
                          // readOnly: true, //this is important
                          // onTap: datePick, //the method for opening data picker
                          // controller: _textcontroller,  //the controller
                        ),
                      ),
                    ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),

                      child: TextFormField(
                        controller: timeTaskController,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Time',
                          hintText: 'Choose time',
                          suffixIcon: Padding(
                            //icon at tail
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.lock_clock),
                          ),
                        ),
                        onTap: () async {
                          final TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: Ttime);

                          if (newTime != null) {
                            setState(() {
                              // Ttime = newTime;
                              timeTaskController.text =
                                  newTime.toString().substring(10, 15);
                            });
                          }
                        },
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
                        Map<String, String> tasks = {
                          'userID': userIDController.text = user.uid,
                          'title': titleTaskController.text,
                          'desc': descTaskController.text,
                          'date': dateTaskController.text,
                          'time': timeTaskController.text
                        };

                        dbRef
                            .child(widget.taskKey)
                            .update(tasks)
                            .then((value) => {Navigator.pop(context)});
                      },
                      child: const Text('Update Task'),
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
                            MaterialPageRoute(builder: (_) => pageTASK()));
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
