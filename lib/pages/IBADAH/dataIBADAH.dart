import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoIbadahList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoIbadahList = [
      ["Zikr", false],
      ["Sadaqah", false],
      ["Dhuha Prayer", false],
      ["Tahajjud Prayer", false],
      ["Recite Quran", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoIbadahList = _myBox.get("TODOIBADAHLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOIBADAHLIST", toDoIbadahList);
  }
}
