import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedule/auth/auth_page.dart';

import 'package:schedule/pages/welcome_page.dart';
// import 'package:schedule/auth/auth_page.dart';
import '../pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 

  @override
  Widget build(BuildContext context) {
    // var bottomNavigationBarItem = BottomNavigationBarItem;

    return Scaffold(
      // child: _widgetOptions.elementAt(_selectedIndex),

      //     SingleChildScrollView(
      //   child: Column(

      //     children: [

      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
          }),
  
    );
  }
}

