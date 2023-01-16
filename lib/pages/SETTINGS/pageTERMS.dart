import 'package:flutter/material.dart';
import 'package:schedule/pages/home_page.dart';
import 'package:schedule/pages/sign_up.dart';

class pageTERMS extends StatelessWidget {
  const pageTERMS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Terms of Service'),
          backgroundColor: Color.fromRGBO(81, 40, 85, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUp(
                          showSignInPage: () {},
                        )),
              );
            },
          ), //IconButton
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                children: [
                  // Title(
                  //   color: Colors.black,
                  //   child: Text(), ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'These terms will automatically apply to you if you download or use the app, so you should be sure you properly read them before using the application.',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ))
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'The programme, its components, or any of our trademarks may not be copied or modified in any way.',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'The app'
                        's source code cannot be attempted to be extracted, and creating derivative works or other language translations of the app is not permitted. ',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ))
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Nurul Saadah and Nur Husnina is still the owner of the app as well as any trademarks, copyrights, database rights, and other associated intellectual property rights.',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'In order to provide our Service, the IIUM E-Planner app stores and uses personal data that you have submitted to us.',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ))
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'You are in charge of keeping the app and your phone secure.',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
