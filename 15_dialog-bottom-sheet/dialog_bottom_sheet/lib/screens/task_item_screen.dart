import 'package:dialog_bottom_sheet/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskItemScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskItemScreen({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final _taskNameController = TextEditingController();
  String taskName = "";

  @override
  void initState() {
    super.initState();
    _taskNameController.addListener(() {
      setState(() {
        taskName = _taskNameController.text;
      });
    });
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a task'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(
              height: 10.0,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Task Name"),
        const SizedBox(height: 10.0),
        TextField(
          controller: _taskNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter task name",
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: const Text(
        "Create",
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
      onPressed: () {
        final taskItem = TaskModel(
          id: const Uuid().v1(),
          title: _taskNameController.text,
        );

        widget.onCreate(taskItem);
      },
    );
  }
}
