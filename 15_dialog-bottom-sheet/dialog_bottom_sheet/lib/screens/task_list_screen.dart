import 'package:dialog_bottom_sheet/components/task_item_card.dart';
import 'package:dialog_bottom_sheet/models/task_manager.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  final TaskManager manager;
  const TaskListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.taskModels;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
          itemCount: taskItems.length,
          itemBuilder: (context, index) {
            final item = taskItems[index];
            // taskItems[0]
            // UUID -> 01290
            // Title -> "Belajar Golang"
            // taskItems[1]
            // UUID -> 01291
            // Title -> "Belajar Dart"
            // taskItems[2]
            // UUID -> 01292
            // Title -> "Belajar Dart"
            return TaskItemCard(
              key: Key(item.id),
              task: item,
              onPressed: () {
                manager.deleteTask(index);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${item.title} Task deleted"),
                  ),
                );
              },
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 10.0,
            );
          }),
    );
  }
}
