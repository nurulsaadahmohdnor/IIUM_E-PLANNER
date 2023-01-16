import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schedule/pages/SETTINGS/pageTERMS.dart';
import 'package:schedule/pages/sign_in.dart';
import 'package:schedule/pages/welcome_page.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showSignInPage;
  const SignUp({Key? key, required this.showSignInPage}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

//a

  Future signUp() async {
    //create user
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    //add user details
    addUserDetails(
   
      _emailController.text.trim(),
    );
  }

  Future<void> addUserDetails(String email) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
       
          'email': email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

 

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _valu1 = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        elevation: 0,
        // centerTitle: true,
        title: Text("Sign Up"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            _navigateToNextScreen(context);
          },
        ),
      ),
      body: SingleChildScrollView(
   
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
        
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
              // padding: const EdgeInsets.only(
              //     left: 15.0, right: 15.0, top: 15, bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),

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
            SizedBox(
              height: 30,
            ),
            Padding(
              // padding: const EdgeInsets.only(
              //     left: 15.0, right: 15.0, top: 15, bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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

            SizedBox(height: 30),

 
            Container(
           

              child: Column(
                
                children: [
                  MaterialButton(
                    splashColor: Colors.green,
                    color: Color.fromRGBO(81, 40, 85, 1),
                    onPressed: () => {signUp()},
                    child: Text(
                      "Sign Up",
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
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                  
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageTERMS()),
                      );
                    },
                    child: Text('Term of services',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
           
                  ),
            
                ],
              ),

    
            ),

            SizedBox(
              height: 20,
            ),

     
      

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I am a member! ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: widget.showSignInPage,
                  child: Text(
                    'Sign In now',
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
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
