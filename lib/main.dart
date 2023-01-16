
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:schedule/auth/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:native_notify/native_notify.dart';
import 'package:schedule/pages/SETTINGS/config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//init hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('myBox');
  var Sbox = await Hive.openBox('mySchedule');

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(81, 40, 85, 1),
          secondary: const Color.fromRGBO(255, 255, 255, 1),
        
        ),
      ),
       
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
    );
  }
}



 