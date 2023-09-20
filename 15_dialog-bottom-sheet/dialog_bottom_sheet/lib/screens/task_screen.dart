import 'package:dialog_bottom_sheet/components/profile_sheet.dart';
import 'package:dialog_bottom_sheet/models/task_manager.dart';
import 'package:dialog_bottom_sheet/screens/empty_task_screen.dart';
import 'package:dialog_bottom_sheet/screens/task_item_screen.dart';
import 'package:dialog_bottom_sheet/screens/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta - 15. Flutter Dialog Bottom Sheet'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                context: context,
                builder: (context) {
                  return const ProfileSheet();
                },
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskItemScreen(
                onCreate: (taskModel) {
                  manager.addTask(taskModel);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<TaskManager>(
      builder: (context, value, child) {
        if (value.taskModels.isNotEmpty) {
          return TaskListScreen(manager: value);
        } else {
          return const EmptyTaskScreen();
        }
      },
    );
  }
}
