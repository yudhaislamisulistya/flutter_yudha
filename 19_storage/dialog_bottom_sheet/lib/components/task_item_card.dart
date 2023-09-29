import 'package:dialog_bottom_sheet/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  final TaskModel task;
  final Function() onPressed;
  const TaskItemCard({Key? key, required this.task, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Text(task.taskName),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Delete Task"),
                    content: const Text("Are you sure you want to delete this task?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: onPressed,
                        child: const Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
