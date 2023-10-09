import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_bloc_contact/bloc/contact_bloc.dart';
import 'package:st_bloc_contact/models/contact_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - Flutter BloC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ContactBloc(),
        child: const MyHomePage(title: 'Alta - Flutter BloC'),
      ),
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
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameChangeController = TextEditingController();
  final _phoneChangeController = TextEditingController();

  @override
  dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactsLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Contacts Updated!')),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ContactBloc>(context).add(
                    AddContactEvent(
                      Contact(
                        name: _nameController.text,
                        phoneNumber: _phoneController.text,
                      ),
                    ),
                  );
                  _nameController.clear();
                  _phoneController.clear();
                  setState(() {});
                },
                child: const Text('Add Contact'),
              ),
              // Display contacts
              if (state is ContactsLoaded)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.contacts[index].name),
                        subtitle: Text(state.contacts[index].phoneNumber),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Edit
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _nameChangeController.text = state.contacts[index].name;
                                  _phoneChangeController.text = state.contacts[index].phoneNumber;
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        title: const Text('Edit Contact'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: _nameChangeController,
                                              decoration: const InputDecoration(labelText: 'Name'),
                                            ),
                                            TextField(
                                              controller: _phoneChangeController,
                                              decoration: const InputDecoration(labelText: 'Phone Number'),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(dialogContext).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              BlocProvider.of<ContactBloc>(context).add(
                                                UpdateContactEvent(
                                                  Contact(
                                                    name: state.contacts[index].name,
                                                    phoneNumber: state.contacts[index].phoneNumber,
                                                  ),
                                                  Contact(
                                                    name: _nameChangeController.text,
                                                    phoneNumber: _phoneChangeController.text,
                                                  ),
                                                ),
                                              );
                                              _nameChangeController.clear();
                                              _phoneChangeController.clear();
                                              Navigator.of(dialogContext).pop();
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Contact Updated!')),
                                              );
                                              setState(() {});
                                            },
                                            child: const Text('Update'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: Text('Are you sure you want to delete ${state.contacts[index].name}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            BlocProvider.of<ContactBloc>(context).add(
                                              DeleteContactEvent(state.contacts[index].name),
                                            );
                                            Navigator.of(dialogContext).pop();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Contact Deleted!')),
                                            );
                                            setState(() {});
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
