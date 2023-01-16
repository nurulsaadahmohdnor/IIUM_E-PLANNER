import 'package:flutter/material.dart';
import 'package:schedule/pages/sign_in.dart';
import 'package:schedule/pages/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignInPage = true;

  void toggleScreens() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignIn(showSignUpPage: toggleScreens);
    } else {
      return SignUp(showSignInPage: toggleScreens);
    }
  }
}
