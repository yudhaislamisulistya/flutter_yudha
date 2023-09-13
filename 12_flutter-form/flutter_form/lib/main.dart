import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - 12. Flutter Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - 12. Flutter Form'),
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
  var formKey = GlobalKey<FormState>();
  // String? name = "";
  // String? alamat = "";
  // String? email = "";

  // List<Data> dataList = [];
  String? radioValue = "";
  bool? checkValue = false;
  int? dropdownValue = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         Form(
      //           key: formKey,
      //           // TextFormField (Name dan Alamat)
      //           child: Container(
      //             padding: const EdgeInsets.all(20.0),
      //             child: Column(
      //               children: [
      //                 TextFormField(
      //                   decoration: const InputDecoration(
      //                     labelText: 'Name',
      //                     hintText: 'Enter your name',
      //                     border: OutlineInputBorder(),
      //                   ),
      //                   validator: (value) {
      //                     name = value;
      //                     if (value == null || value.isEmpty) {
      //                       return 'Please enter your name';
      //                     }
      //                     return null;
      //                   },
      //                 ),
      //                 const SizedBox(
      //                   height: 20.0,
      //                 ),
      //                 TextFormField(
      //                   decoration: const InputDecoration(
      //                     labelText: "Alamat",
      //                     hintText: "Enter your address",
      //                     border: OutlineInputBorder(),
      //                   ),
      //                   validator: (value) {
      //                     alamat = value;
      //                     if (value == null || value.isEmpty) {
      //                       return "Please enter your address";
      //                     }
      //                     return null;
      //                   },
      //                 ),
      //                 const SizedBox(
      //                   height: 20.0,
      //                 ),
      //                 TextFormField(
      //                   decoration: const InputDecoration(
      //                     labelText: "Email",
      //                     hintText: "Enter your email address",
      //                     border: OutlineInputBorder(),
      //                   ),
      //                   validator: (value) {
      //                     email = value;
      //                     if (!value!.contains("@")) {
      //                       return "enter a valid email";
      //                     }

      //                     return null;
      //                   },
      //                 ),
      //                 Row(
      //                   children: [
      //                     ElevatedButton(
      //                       onPressed: () {
      //                         if (formKey.currentState!.validate()) {
      //                           ScaffoldMessenger.of(context).showSnackBar(
      //                             const SnackBar(
      //                               content: Text("Data berhasil disimpan"),
      //                             ),
      //                           );
      //                           dataList.add(Data(
      //                             name: name,
      //                             alamat: alamat,
      //                             email: email,
      //                           ));

      //                           setState(() {});

      //                           formKey.currentState!.reset();
      //                         }
      //                       },
      //                       child: const Text("Simpan"),
      //                     ),
      //                     const SizedBox(
      //                       width: 20.0,
      //                     ),
      //                     ElevatedButton(
      //                       onPressed: () {
      //                         ScaffoldMessenger.of(context).showSnackBar(
      //                           const SnackBar(
      //                             content: Text("Data berhasil Dihapus"),
      //                           ),
      //                         );
      //                         // remote dataList
      //                         dataList.clear();

      //                         setState(() {});

      //                         formKey.currentState!.reset();
      //                       },
      //                       child: const Text("Reset"),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         for (var i = 0; i < dataList.length; i++)
      //           Container(
      //             margin: const EdgeInsets.all(10.0),
      //             decoration: BoxDecoration(
      //               color: Colors.orange,
      //               borderRadius: BorderRadius.circular(20.0),
      //             ),
      //             child: ListTile(
      //               title: Text(dataList[i].name.toString()),
      //               subtitle: Row(
      //                 children: [
      //                   Text(dataList[i].alamat.toString()),
      //                   Text(dataList[i].email.toString()),
      //                 ],
      //               ),
      //             ),
      //           ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter Your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Address",
                hintText: "Enter Your Address",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text == null || nameController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Name tidak boleh kosong"),
                    ),
                  );
                }
                if (addressController.text == null || addressController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Address tidak boleh kosong"),
                    ),
                  );
                }
              },
              child: const Text("Simpan"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Laki-Laki"),
                    Radio<String>(
                      value: "Laki-Laki",
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value;
                        });
                        print(radioValue);
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Perempuan"),
                    Radio<String>(
                      value: "Perempuan",
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value;
                        });
                        print(radioValue);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Text(radioValue!),
            Checkbox(
              value: checkValue,
              onChanged: (value) {
                setState(() {
                  checkValue = value ?? false;
                });
                print(checkValue);
              },
            ),
            DropdownButton(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text("SD"),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text("SMP"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("SMA"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.access_alarm),
              onPressed: () {},
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data berhasil disimpan"),
                  ),
                );
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50.0),
                  image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/1076/1076744.png"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Data {
//   String? name;
//   String? alamat;
//   String? email;

//   Data({this.name, this.alamat, this.email});
// }
