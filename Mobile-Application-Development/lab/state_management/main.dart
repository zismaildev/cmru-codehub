import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_screen.dart';

// --- Model ---
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl; // Changed from color to imageUrl

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

/// **Product Provider**
/// Manages global application state for Products and Favorites using the Provider pattern.
///
/// Functions:
/// - Stores master list of [Product]
/// - Manages set of favorite product IDs
/// - Notifies listeners on state changes
class ProductProvider with ChangeNotifier {
  /// Mock Data Repository with High-Quality Images
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Apple (แอปเปิ้ล)',
      price: 35.0,
      imageUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500&q=80',
    ),
    Product(
      id: '2',
      name: 'Banana (กล้วย)',
      price: 15.0,
      imageUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?q=80',
    ),
    Product(
      id: '3',
      name: 'Orange (ส้ม)',
      price: 40.0,
      imageUrl: 'https://images.unsplash.com/photo-1536657464919-892534f60d6e?q=80',
    ),
    Product(
      id: '4',
      name: 'Mango (มะม่วง)',
      price: 60.0,
      imageUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&q=80',
    ),
    Product(
      id: '5',
      name: 'Grape (องุ่น)',
      price: 120.0,
      imageUrl: 'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=500&q=80',
    ),
    Product(
      id: '6',
      name: 'Strawberry (สตรอว์เบอร์รี)',
      price: 250.0,
      imageUrl: 'https://images.unsplash.com/photo-1587393855524-087f83d95bc9?w=500&q=80',
    ),
    Product(
      id: '7',
      name: 'Watermelon (แตงโม)',
      price: 80.0,
      imageUrl: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=500&q=80',
    ),
    Product(
      id: '8',
      name: 'Pineapple (สับปะรด)',
      price: 50.0,
      imageUrl: 'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?w=500&q=80',
    ),
    Product(
      id: '9',
      name: 'Durian (ทุเรียน)',
      price: 500.0,
      imageUrl: 'https://images.unsplash.com/photo-1666614577712-27a7557b7047?w=500&q=80',
    ),
    Product(
      id: '10',
      name: 'Papaya (มะละกอ)',
      price: 30.0,
      imageUrl: 'https://images.unsplash.com/photo-1617112848923-cc2234396a8d?q=80&w=500',
    ),
  ];

  final Set<String> _favoriteIds = {};

  List<Product> get products => _products;

  List<Product> get favorites {
    return _products.where((p) => _favoriteIds.contains(p.id)).toList();
  }

  bool isFavorite(String id) {
    return _favoriteIds.contains(id);
  }

  void toggleFavorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }
}

// --- App Entry & Main Screen ---
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ตลาดผลไม้สด (Fresh Fruit)', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Consumer<ProductProvider>(
              builder: (context, provider, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.pink, size: 28),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                        );
                      },
                    ),
                    if (provider.favorites.isNotEmpty)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${provider.favorites.length}',
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                final isFav = provider.isFavorite(product.id);
                
                return Card(
                  elevation: 4,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image Area
                      Expanded(
                        flex: 3,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey[200],
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      // Detail Area
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '฿${product.price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    provider.toggleFavorite(product.id);
                                  },
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: isFav ? Colors.pink[50] : Colors.grey[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.pink : Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
