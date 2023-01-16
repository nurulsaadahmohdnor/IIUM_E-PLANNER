import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:schedule/pages/CALENDAR/insertCALENDAR.dart';
import 'package:schedule/pages/CALENDAR/updateCALENDAR.dart';
import 'package:schedule/pages/home_page.dart';
import 'package:table_calendar/table_calendar.dart';

class pageCALENDAR extends StatefulWidget {
  const pageCALENDAR({Key? key}) : super(key: key);

  @override
  State<pageCALENDAR> createState() => _pageCALENDARState();
}

class _pageCALENDARState extends State<pageCALENDAR> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Schedules');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Schedules');

  Widget listItem({required Map schedule}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
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
                      schedule['event'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      schedule['note'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      schedule['date'],
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Start Time:' + schedule['startTime'],
                      style: TextStyle(
                          color: Color.fromRGBO(81, 40, 85, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'End Time:' + schedule['endTime'],
                      style: TextStyle(
                          color: Color.fromRGBO(81, 40, 85, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
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
                                    builder: (_) => UpdateCALENDAR(
                                        scheduleKey: schedule['key'])));
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
                            reference.child(schedule['key']).remove();
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

  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => InsertCALENDAR(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Schedule'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.calendar_month_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: TableCalendar(
              rowHeight: 50,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            )),
            SizedBox(
              height: 20,
            ),
            Text("Selected Day = " + today.toString().split(" ")[0]),
            SizedBox(
              height: 50,
            ),
            Container(
              // height: double.infinity,
              height: 500,
              // height: double.infinity,
              // width: 50,
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map schedule = snapshot.value as Map;
                  schedule['key'] = snapshot.key;

                  return listItem(schedule: schedule);
                },
              ),
            ),
          ],
        ),
      ),
    );
    // body: content());
  }


}
