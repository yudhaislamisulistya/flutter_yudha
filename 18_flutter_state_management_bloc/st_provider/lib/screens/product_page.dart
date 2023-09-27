import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_provider/models/cart_manager.dart';
import 'package:st_provider/models/product.dart';
import 'package:st_provider/screens/cart_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
        ],
      ),
      body: const ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final List<String> productList = Product().productList;
    print(productList);
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.amber.withOpacity(0.1),
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah Kolom
          mainAxisSpacing: 16.0, // Spasi Secara Vertical
          crossAxisSpacing: 16.0, // Spasi Secara Horizontal
        ),
        itemBuilder: (context, index) {
          return Consumer<CartManager>(
            builder: (context, item, child) {
              return ProductCards(
                productName: productList[index],
                isAdded: item.cartList.contains(productList[index]),
                onTap: () {
                  setState(
                    () {
                      item.complete(productList[index]);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCards extends StatelessWidget {
  final String productName;
  final bool isAdded;
  final Function() onTap;
  const ProductCards({
    super.key,
    required this.productName,
    required this.isAdded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              'https://picsum.photos/id/0/400/300',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      isAdded ? Icons.check_circle : Icons.shopping_cart,
                    ),
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
