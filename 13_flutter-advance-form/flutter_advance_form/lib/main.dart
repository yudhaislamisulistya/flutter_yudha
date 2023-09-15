import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import "package:file_picker/file_picker.dart";
import "package:open_file/open_file.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '13. Flutter Advanced Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - 13. Flutter Advanced Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.deepPurple;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg"],
      allowMultiple: true,
    );
    if (result == null) return;

    // final file = result.files.first;
    List<File> files = result.paths.map((path) => File(path!)).toList();
    List<PlatformFile> platformFiles = result.files;

    for (var i = 0; i < files.length; i++) {
      print(files[i].path);
      print(platformFiles[i].name);
    }

    for (var file in platformFiles) {
      _openFile(file);
    }
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            buildDatePicker(context),
            buildColorPicker(context),
            buildFilePicker(),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date"),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  _dueDate = selectDate!;
                });
              },
              child: const Text("Select Date"),
            ),
          ],
        ),
        Text(
          DateFormat("dd-MM-yyyy").format(_dueDate),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      children: [
        const Text("Color"),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          height: 200.0,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
            ),
            child: const Text(
              "Pick a color",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Pick your Color"),
                    content: ColorPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (value) {
                        setState(() {
                          _currentColor = value;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Pick your file"),
        const SizedBox(
          height: 10.0,
        ),
        Center(
          child: ElevatedButton(
            child: const Text("Pick and Open File"),
            onPressed: () {
              _pickFile();
            },
          ),
        )
      ],
    );
  }
}
