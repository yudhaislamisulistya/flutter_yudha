import 'package:dialog_bottom_sheet/helper/database_helper.dart';
import 'package:dialog_bottom_sheet/models/task_model.dart';
import 'package:flutter/material.dart';

class DBManager with ChangeNotifier {
  List<TaskModel> taskModels = [];
  late DatabaseHelper _databaseHelper;

  List<TaskModel> get tasks => taskModels;

  DBManager() {
    _databaseHelper = DatabaseHelper();
    getAllTasks();
  }

  void getAllTasks() async {
    taskModels = await _databaseHelper.getTasks();
    notifyListeners();
  }

  void addTask(TaskModel taskModel) async {
    await _databaseHelper.insertTask(taskModel);
    getAllTasks();
  }

  void updateTask(TaskModel taskModel) async {
    await _databaseHelper.updateTask(taskModel);
    getAllTasks();
  }

  void deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
    getAllTasks();
  }

  Future<TaskModel> getTaskById(int id) async {
    return await _databaseHelper.getTaskById(id);
  }
}
