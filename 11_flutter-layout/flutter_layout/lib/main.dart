import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - Flutter Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - Flutter Layout'),
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("Nilai dari Lebar");
    print(width);
    print("Nilai dari Tinggi");
    print(height);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body: Center(
      //   child: Container(
      //     margin: const EdgeInsets.all(20.0),
      //     padding: const EdgeInsets.all(20.0),
      //     decoration: BoxDecoration(
      //       color: Colors.pinkAccent,
      //       border: Border.all(
      //         color: Colors.black,
      //         width: 10.0,
      //       ),
      //     ),
      //     height: 100.0,
      //     width: MediaQuery.of(context).size.width,
      //     child: const Text("Selamat Datang di Alterra Academy"),
      //   ),
      // ),
      // body: const SizedBox(
      //   height: 100.0,
      //   width: 100.0,
      // ),
      // body: Container(
      //   width: width,
      //   height: height,
      //   color: Colors.orange,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         color: Colors.white,
      //         child: const Text("Flutter C"),
      //       ),
      //       const SizedBox(
      //         height: 20.0,
      //       ),
      //       const Text("Alterra Academy"),
      //       const SizedBox(
      //         height: 20.0,
      //       ),
      //       const Text("Front End Enginerer With Flutter"),
      //     ],
      //   ),
      // ),
      // body: const Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Text("Alterra Academy - "),
      //     Text("Flutter C - "),
      //     Text("25 Person"),
      //   ],
      // ),
      // body: Container(
      //   width: width,
      //   height: height,
      //   color: Colors.orange,
      //   child: ListView(
      //     scrollDirection: Axis.vertical,
      //     physics: const BouncingScrollPhysics(),
      //     children: const [
      //       WidgetA(name: "Reynaldo Huang", className: "Flutter C"),
      //       WidgetA(name: "Nurul", className: "Flutter C"),
      //       WidgetA(name: "Hafiz", className: "Flutter C"),
      //       WidgetA(name: "Hafidz", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //       WidgetA(name: "Alvin", className: "Flutter C"),
      //     ],
      //   ),
      // ),
      // body: Container(
      //   padding: const EdgeInsets.all(10.0),
      //   child: GridView.count(
      //     crossAxisCount: 4,
      //     crossAxisSpacing: 10.0,
      //     mainAxisSpacing: 10.0,
      //     children: const [
      //       NewWidget(),
      //       NewWidget(),
      //       NewWidget(),
      //       NewWidget(),
      //       NewWidget(),
      //       NewWidget(),
      //       NewWidget(),
      //       NewWidget(),
      //     ],
      //   ),
      // ),
      // body: const Column(
      //   children: [
      //     ChatWidget(),
      //     ChatWidget(),
      //     ChatWidget(),
      //     ChatWidget(),
      //     ChatWidget(),
      //     ChatWidget(),
      //     ChatWidget(),
      //   ],
      // ),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Ini Button"),
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const ListTile(
        leading: Text("1"),
        title: Text("Ade Fery Angriawan"),
        subtitle: Text("Hari Ini Kelas Flutter?"),
        trailing: Text("12.09"),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.orange,
        child: const Center(
          child: Text("Flutter A"),
        ),
      ),
    );
  }
}

// class WidgetA extends StatelessWidget {
//   final String? name;
//   final String? className;

//   const WidgetA({super.key, this.name, this.className});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(20.0),
//       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 150.0,
//             child: Text(
//               name!,
//               textAlign: TextAlign.end,
//             ),
//           ),
//           const SizedBox(
//             width: 20.0,
//           ),
//           Container(
//             width: 150.0,
//             child: Text(
//               className!,
//               textAlign: TextAlign.start,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
