

import 'package:flutter/material.dart';
import 'package:schedule/pages/sign_in.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IIUM E-PLANNER',

      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 40, 85, 1),
      // appBar: AppBar(title: const Text('E-Planner')),
      body: Center(
        child: Column(
          //   // child:  ElevatedButton(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Minimalist Simple Brand logo.png', scale: 1.8),
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          _navigateToNextScreen(context);
        },
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignIn(
               showSignUpPage: () {},
            )));
  }
}

