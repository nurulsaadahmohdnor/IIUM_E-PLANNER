import 'package:flutter/material.dart';
import 'package:schedule/pages/IBADAH/myButtonIBADAH.dart';

class DialogBox extends StatelessWidget {
  final TitleController;
  // final DescController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.TitleController,
    // required this.DescController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Container(
          height: 190,
          width: 300,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: TitleController,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: 'Ibadah checklist',
                        hintText: 'Add a checklist'),
                  ),
                ),

            
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //save button
                    MyButton(text: "Save", onPressed: onSave),

                    const SizedBox(width: 5),
                    //cancel button
                    MyButton(text: "Cancel", onPressed: onCancel),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
