import 'package:hive_flutter/hive_flutter.dart';

class TaskDatabase {
  List taskList = [];

  // Reference our box
  final taskBox = Hive.box('taskBox');

  // Create initial data / default task for the 1st time
  void createInitialData() {
    taskList = [
      ["This is your first task!", false]
    ];
  }

  // Load data from db
  void loadData() {
    taskList = taskBox.get('myTasks');
  }

  // Update data into db
  void updateData() {
    taskBox.put('myTasks', taskList);
  }
}
