import 'package:dialog_bottom_sheet/models/db_manager.dart';
import 'package:dialog_bottom_sheet/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TaskItemScreen extends StatefulWidget {
  final TaskModel? taskModel;
  const TaskItemScreen({Key? key, this.taskModel}) : super(key: key);

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final _taskNameController = TextEditingController();
  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.taskModel != null) {
      _taskNameController.text = widget.taskModel!.taskName;
      _isUpdate = true;
    }
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
        if (!_isUpdate) {
          final task = TaskModel(taskName: _taskNameController.text);
          Provider.of<DBManager>(context, listen: false).addTask(task);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Task added"),
            ),
          );
        } else {
          final task = TaskModel(
            id: widget.taskModel!.id,
            taskName: _taskNameController.text,
          );
          Provider.of<DBManager>(context, listen: false).updateTask(task);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Task updated"),
            ),
          );
        }
      },
    );
  }
}
