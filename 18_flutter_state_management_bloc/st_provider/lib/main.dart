import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_provider/models/cart_manager.dart';
import 'package:st_provider/screens/product_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: MaterialApp(
        title: 'Shop Cart - Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: const ProductPage(),
      ),
    );
  }
}
