import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_provider/models/cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartManager>(context, listen: false).cartList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.amber.withOpacity(0.1),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartList[index]),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Buy"),
            ),
          ],
        ),
      ),
    );
  }
}
