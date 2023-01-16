import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromRGBO(81, 40, 85, 1),
      child: Text(text),
      textColor: Colors.white,
      minWidth: 20,
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    );
  }
}
