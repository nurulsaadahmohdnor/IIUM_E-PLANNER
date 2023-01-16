import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:schedule/pages/EXAM/fetchEXAM.dart';

class InsertEXAM extends StatefulWidget {
  const InsertEXAM({Key? key}) : super(key: key);

  @override
  State<InsertEXAM> createState() => _InsertEXAMState();
}

class _InsertEXAMState extends State<InsertEXAM> {
  final userIDController = TextEditingController();
  final titleExamController = TextEditingController();
  final descExamController = TextEditingController();
  final timeExamController = TextEditingController();
  final dateExamController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Exams');
  }

  TimeOfDay Ttime = TimeOfDay(hour: 10, minute: 30);
  final user = FirebaseAuth.instance.currentUser;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exam'),
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
                      'Add Exam',
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
                          controller: titleExamController,
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
                          controller: descExamController,
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
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        child: TextFormField(
                          controller: dateExamController,
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
                                dateExamController.text =
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
                        controller: timeExamController,
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
                              timeExamController.text =
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
                        Map<String, String> exams = {
                          'userID': userIDController.text = user!.uid,
                          'title': titleExamController.text,
                          'desc': descExamController.text,
                          'date': dateExamController.text,
                          'time': timeExamController.text
                        };

                        dbRef.push().set(exams);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => pageEXAM()));
                      },
                      child: const Text('Save Exam'),
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
                            MaterialPageRoute(builder: (_) => pageEXAM()));
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
