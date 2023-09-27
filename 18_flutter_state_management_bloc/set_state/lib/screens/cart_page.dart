import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> cartList;
  const CartPage({super.key, required this.cartList});

  @override
  Widget build(BuildContext context) {
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
