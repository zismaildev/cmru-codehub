import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/stock_provider.dart';
import 'screens/portfolio_screen.dart';

void main() {
  runApp(const MyStock());
}

class MyStock extends StatelessWidget {
  const MyStock({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StockProvider(),
      child: MaterialApp(
        title: "Stock Portfolio",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PortfolioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "หน้าหลัก",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "รายการ",
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Portfolio"),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<StockProvider>(
        builder: (context, stockProvider, child) {
          final totalInvested = stockProvider.totalInvested;
          final totalTransactions = stockProvider.totalTransactions;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ภาพรวม',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                // ยอดลงทุนรวม
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ยอดลงทุนรวม:', style: TextStyle(fontSize: 16)),
                      Text(
                        '\$${totalInvested.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                
                // จำนวนธุรกรรม
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('จำนวนธุรกรรม:', style: TextStyle(fontSize: 16)),
                      Text(
                        '$totalTransactions รายการ',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                
                // ปุ่มไปดูรายการ
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PortfolioScreen()),
                      );
                    },
                    child: const Text('ดูรายการทั้งหมด'),
                  ),
                ),
                const SizedBox(height: 20),
                
                // หมายเหตุ
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.yellow[100],
                  child: const Text(
                    'หมายเหตุ: ข้อมูลในแอปเป็นข้อมูลตัวอย่าง (Mock Data)',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

