import 'package:dialog_bottom_sheet/models/db_manager.dart';
import 'package:dialog_bottom_sheet/models/task_manager.dart';
import 'package:dialog_bottom_sheet/screens/login_screen.dart';
import 'package:dialog_bottom_sheet/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DBManager()),
      ],
      child: MaterialApp(
        title: 'Alta - 15. Flutter Dialog Bottom Sheet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const LoginScreen(),
          "/taskScreen": (context) => const TaskScreen(),
        },
      ),
    );
  }
}
