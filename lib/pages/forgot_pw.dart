import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        centerTitle: true,
        title: Text("Forgot Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center),
          SizedBox(
            height: 30,
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email as abc@gmail.com'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // MaterialButton(
          //   onPressed: passwordReset,
          //   child: Text('Reset Password'),
          //   // const TextStyle(color: Colors.purple, fontSize: 20),
          //   color: Color.fromRGBO(81, 40, 85, 1),
          // )

          MaterialButton(
            splashColor: Colors.green,
            color: Color.fromRGBO(81, 40, 85, 1),
            onPressed: passwordReset,
            child: Text(
              "Reset Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            minWidth: 200.0,
            height: 35,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ],
      ),
    );
  }
}
