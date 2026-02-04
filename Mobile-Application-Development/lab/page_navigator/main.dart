import 'package:flutter/material.dart';
import 'screens/details_screen.dart';
// import '../../../Page Navigator/models/product.dart';

void main() {
  runApp(MySimpleStore());
}

class MySimpleStore extends StatelessWidget {
  const MySimpleStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple Store",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: SimpleStoreApp(),
    );
  }
}

class SimpleStoreApp extends StatefulWidget {
  const SimpleStoreApp({super.key});

  @override
  State<SimpleStoreApp> createState() => _SimpleStoreAppState();
}

class _SimpleStoreAppState extends State<SimpleStoreApp> {
  String resultText = "No result yet";

  final List<Product> products = [
    Product(
      name: "Laptop Gaming",
      price: 25000,
      imagePath: "assets/images/Laptop-Gaming.jpg",
      description:
          "High performance gaming laptop with latest GPU and fast processor.",
    ),
    Product(
      name: "Smartphone 5G",
      price: 12000,
      imagePath: "assets/images/Smartphone-5G.jpg",
      description:
          "Next-gen 5G smartphone with amazing camera and battery life.",
    ),
    Product(
      name: "Wireless Headphones",
      price: 3500,
      imagePath: "assets/images/Wireless-Headphones.png",
      description:
          "Noise cancelling wireless headphones with premium sound quality.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simple Store",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return _buildProductItem(context, products[index]);
        },
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product),
            ),
          );

          if (result != null) {
            setState(() {
              resultText = result;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: product.name,
              child: SizedBox(
                height: 150,
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${product.price.toStringAsFixed(0)} ฿",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProduct extends StatelessWidget {
  const MyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
