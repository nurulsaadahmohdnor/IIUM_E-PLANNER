import 'package:flutter/material.dart';
import 'package:schedule/pages/home_page.dart';

class pageHELP extends StatelessWidget {
  const pageHELP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help'),
          backgroundColor: Color.fromRGBO(81, 40, 85, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.question_mark_rounded),
            ),
          ], //IconButton
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '1. How to sign up to this application.',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '= Click sign up button below the sign in page and fill up the information given.',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '2. How to retrieve my account if I forgot my password?',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '= User simply click forgot password and fill up your email address. Reset password link was sent to your email immediately.',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '3. Is my profile and what ever task that i already update on the app will automatically saved for future refference.',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '= Yes, as long as you still can sign in using your email and password, u can access all the features and your data are kept in our databases.',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
