import 'package:flutter/material.dart';
import 'package:flutter_sm_provider/add_contact.dart';
import 'package:flutter_sm_provider/contact.dart';
import 'package:flutter_sm_provider/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Contact()),
        ChangeNotifierProvider(create: (_) => User()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - 17. Flutter State Management Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - 17. Flutter State Management Provider'),
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
  var number = 0;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             number = number + 1;
      //           });
      //         },
      //         child: const Text('Tambah'),
      //       ),
      //       Text('$number'),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddContact(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: contactProvider.contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contactProvider.contacts[index]['name']!),
              subtitle: Text(contactProvider.contacts[index]['phone']!),
              trailing: IconButton(
                onPressed: () {
                  contactProvider.remove(index);
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
