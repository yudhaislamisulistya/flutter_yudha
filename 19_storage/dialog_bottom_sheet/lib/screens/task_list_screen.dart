import 'package:dialog_bottom_sheet/components/task_item_card.dart';
import 'package:dialog_bottom_sheet/models/db_manager.dart';
import 'package:dialog_bottom_sheet/models/task_manager.dart';
import 'package:dialog_bottom_sheet/screens/task_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  final DBManager manager;
  const TaskListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.taskModels;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<DBManager>(builder: (context, manager, child) {
        final taskItems = manager.taskModels;
        return ListView.separated(
          itemCount: taskItems.length,
          itemBuilder: (context, index) {
            final item = taskItems[index];
            return InkWell(
              onTap: () async {
                final selectedTask = await manager.getTaskById(item.id!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskItemScreen(
                      taskModel: selectedTask,
                    ),
                  ),
                );
              },
              child: TaskItemCard(
                key: ValueKey(item.id),
                task: item,
                onPressed: () {
                  manager.deleteTask(item.id!);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${item.taskName} Task deleted"),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 10.0,
            );
          },
        );
      }),
    );
  }
}
