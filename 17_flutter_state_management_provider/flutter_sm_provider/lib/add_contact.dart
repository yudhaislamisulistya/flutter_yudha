import 'package:flutter/material.dart';
import 'package:flutter_sm_provider/contact.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kontak'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                    ),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telepon',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      contactProvider.add({
                        'name': _nameController.text,
                        'phone': _phoneController.text,
                      });
                    },
                    child: const Text('Tambah'),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: contactProvider.contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contactProvider.contacts[index]['name']!),
                    subtitle: Text(contactProvider.contacts[index]['phone']!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
