import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rest_api/models/book_model.dart';
import 'package:motion_toast/motion_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - 20. REST API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - 20. REST API'),
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
  List<BookModel> books = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Dio().get("https://bookapi-1-v1905306.deta.app/api/v1/books/").then((responses) {
      var data = responses.data;
      for (var i = 0; i < data.length; i++) {
        books.add(BookModel.fromJson(data[i]));
      }
      setState(() {});

      // print(responses);
      // print(responses.data[0]["id"]);
      // print(responses.data[0]["name"]);
      // print(responses.data[0]["phone"]);
      // print(responses.data[1]);
      // print(responses.data[2]);
      // for (var i = 0; i < responses.data.length; i++) {
      //   print(responses.data[i]["id"]);
      //   print(responses.data[i]["name"]);
      //   print(responses.data[i]["phone"]);
      // }

      // var user = {
      //   "id": 4,
      //   "name": "Hadi",
      //   "phone": "081234567890",
      // };

      // var users = [
      //   {
      //     "id": 4,
      //     "name": "Hadi",
      //     "phone": "081234567890",
      //   },
      //   {
      //     "id": 5,
      //     "name": "Hadi",
      //     "phone": "081234567890",
      //   },
      //   {
      //     "id": 6,
      //     "name": "Hadi",
      //     "phone": "081234567890",
      //   },
      // ];
    });
    // var dataMap = {
    //   "id": 4,
    //   "name": "Hadi",
    //   "phone": "081234567890",
    // };
    // var dataJson = jsonEncode(dataMap);
    // print(dataMap);
    // print(dataJson);
    // var dataMapDeserialized = jsonDecode(dataJson);
    // print(dataMapDeserialized);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    yearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Book"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: "Title",
                      ),
                    ),
                    TextField(
                      controller: yearController,
                      decoration: const InputDecoration(
                        labelText: "Year",
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      var data = {
                        "book_id": books.length + 1,
                        "title": titleController.text,
                        "year": int.parse(yearController.text),
                      };
                      Dio().post("https://bookapi-1-v1905306.deta.app/api/v1/books/", data: jsonEncode(data)).then((response) {
                        var response_detail = response.data["detail"];
                        if (response_detail["status_code"] == 201) {
                          print("Data Berhasil Ditambahkan");
                          books.add(BookModel.fromJson(response.data["data"]));
                          setState(() {});
                        } else {
                          print("Data Gagal Ditambahkan");
                        }
                      });
                    },
                    child: const Text("Save"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(books[index].title),
              subtitle: Text(books[index].year.toString()),
            );
          },
        ),
      ),
    );
  }
}
