// import 'package:flutter/material.dart';

// class signIn extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Text(
//             "Hello Second Activity",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 30
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//  import 'package:flutter/material.dart';
// class SignIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('New Screen')),
//       body: const Center(
//         child: Text(
//           'This is a Sign In',
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schedule/pages/forgot_pw.dart';
import 'package:schedule/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedule/pages/welcome_page.dart';

// import 'sign_up.dart';
// import '../main.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';

class SignIn extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const SignIn({Key? key, required this.showSignUpPage}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
  // _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isHidden = true;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }
  // static Future<User?> loginUsingEmailPassword(
  //     {required String email,
  //     required String password,
  //     required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try{
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found"){
  //       print("No user found for that email");

  //     }
  //   }

  //   return user;

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        elevation: 0, //did not want a shadow
        // centerTitle: true,
        title: Text("Sign In"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            _navigateToNextScreen(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // debugShowCheckedModeBanner: false,
        //   theme: ThemeData(
        //     primaryColor: generateMaterialColorFromColor(Color(0xFF512855))),
        // backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,

                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset(
                      'assets/E-PLANNER_LOGO-removebg-preview.png',
                      width: 80.0,
                      height: 200.0,
                    )),
              ),
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passwordController,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  // border: OutlineInputBorder(),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ForgotPassword()));
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //  primaryColors: Colors.yellowAccent,
                  // primaryColor: generateMaterialColorFromColor(Color(0xFF512855))),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            Container(
              // height: 40,
              // width: 350,
              // decoration: BoxDecoration(
              //     // color: Colors.purple,
              //     //  primaryColor: generateMaterialColorFromColor(Color(0xFF512855))),
              //     borderRadius: BorderRadius.circular(60)),
              // child: ElevatedButton(
              //   onPressed: () async {
              // User? user = await loginUsingEmailPassword( email:_emailController.text,password:_passwordController context:context),
              // print(user);
              // if( user != null){
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> WelcomeScreen()))
              // }

              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => MyApp()));
              // },
              // child: GestureDetector(
              //   onTap: signIn,
              //   //  onTap: widget.signIn(),
              //   // onPressed: signIn(),
              //   // onPressed: () => Navigator.push(...)
              //   // onTap:signIn(),

              //   child: Text(
              //     'Sign In',
              //     style: TextStyle(color: Colors.purple, fontSize: 20),
              //   ),
              // ),
              // ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    splashColor: Colors.green,
                    color: Color.fromRGBO(81, 40, 85, 1),
                    onPressed: () => {signIn()},
                    child: Text(
                      "Sign In",
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
                  // MaterialButton(
                  //   onPressed: () => {signIn()},
                  //   // color: Colors.deepPurple,
                  //   color: Color.fromRGBO(81, 40, 85, 1),
                  //   child: Text('Sign In'),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),

            // Container(
            //   // child: TextButton(
            //   // onPressed: () {},
            //   // onPressed: () {
            //   //   Navigator.push(
            //   //       context, MaterialPageRoute(builder: (_) => SignUp()));
            //   // },
            //   child: GestureDetector(
            //     onTap: widget.showSignUpPage,
            //     child: Text('Dont have an account? Sign Up'
            //         //               // style: TextStyle(
            //         //   color: Colors.blue,
            //         // ),
            //         ),
            //   ),
            // ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: widget.showSignUpPage,
                  child: Text(
                    'Sign Up now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )

            // Text('New User? Create Account')
          ],
        ),
      ),
    );
  }

// void _navigateToNextScreen(BuildContext context) {
//   Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => SignUp()));
// }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WelcomePage()));
  }
}

// MaterialColor generateMaterialColorFromColor(Color color) {
//   return MaterialColor(color.value, {
//     50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
//     100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
//     200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
//     300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
//     400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
//     500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
//     600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
//     700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
//     800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
//     900: Color.fromRGBO(color.red, color.green, color.blue, 1.0),
//   });
// }
