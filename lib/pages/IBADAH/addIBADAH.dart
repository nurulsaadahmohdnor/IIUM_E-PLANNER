import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddIbadah extends StatelessWidget {
  final String taskName;
  // final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  AddIbadah({
    super.key,
    required this.taskName,
    // required this.taskDescription,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        startActionPane: ActionPane(motion: StretchMotion(), children: [
     
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.green,
              ),

              //task name
              Text(taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  )),

      
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
