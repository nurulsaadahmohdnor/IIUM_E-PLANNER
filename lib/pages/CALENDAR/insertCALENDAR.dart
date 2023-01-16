import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:schedule/pages/CALENDAR/pageCALENDAR.dart';
import 'package:schedule/pages/EXAM/fetchEXAM.dart';

class InsertCALENDAR extends StatefulWidget {
  const InsertCALENDAR({Key? key}) : super(key: key);

  @override
  State<InsertCALENDAR> createState() => _InsertCALENDARState();
}

class _InsertCALENDARState extends State<InsertCALENDAR> {
  final userIDController = TextEditingController();
  final eventScheduleController = TextEditingController();
  final noteScheduleController = TextEditingController();
  final dateScheduleController = TextEditingController();
  final startTimeScheduleController = TextEditingController();
  final endTimeScheduleController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Schedules');
  }

  TimeOfDay Ttime = TimeOfDay(hour: 10, minute: 30);
  final user = FirebaseAuth.instance.currentUser;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
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
                      'Add Event',
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
                          controller: eventScheduleController,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Event',
                              hintText: 'Enter an event'),
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
                          controller: noteScheduleController,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Note',
                              hintText: 'Enter note'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        child: TextFormField(
                          controller: dateScheduleController,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Date',
                            hintText: 'Choose the date',
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
                                dateScheduleController.text =
                                    DateFormat('E | d MMM yyyy')
                                        .format(pickeddate);
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),

                      child: TextFormField(
                        controller: startTimeScheduleController,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Start Time',
                          hintText: 'Choose start time',
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
                              startTimeScheduleController.text =
                                  newTime.toString().substring(10, 15);
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),

                      child: TextFormField(
                        controller: endTimeScheduleController,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'End Time',
                          hintText: 'Choose end time',
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
                              endTimeScheduleController.text =
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
                        Map<String, String> schedules = {
                          'userID': userIDController.text = user!.uid,
                          'event': eventScheduleController.text,
                          'note': noteScheduleController.text,
                          'date': dateScheduleController.text,
                          'startTime': startTimeScheduleController.text,
                          'endTime': endTimeScheduleController.text
                        };

                        dbRef.push().set(schedules);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => pageCALENDAR()));
                      },
                      child: const Text('Save Event'),
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
                            MaterialPageRoute(builder: (_) => pageCALENDAR()));
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
