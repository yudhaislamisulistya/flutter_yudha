import 'package:dialog_bottom_sheet/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskManager extends ChangeNotifier {
  final _taskModels = <TaskModel>[];
  List<TaskModel> get taskModels => List.unmodifiable(_taskModels);

  void deleteTask(int index) {
    _taskModels.removeAt(index);
    notifyListeners();
  }

  void addTask(TaskModel taskModel) {
    _taskModels.add(taskModel);
    notifyListeners();
  }
}
