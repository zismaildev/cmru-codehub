import 'package:flutter/material.dart';

void main() {
  runApp(MyExchange());
}

class MyExchange extends StatelessWidget {
  const MyExchange({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Exchange App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: ExchangeApp(),
    );
  }
}

class ExchangeApp extends StatefulWidget {
  const ExchangeApp({super.key});

  @override
  State<ExchangeApp> createState() => _ExchangeAppState();
}

class _ExchangeAppState extends State<ExchangeApp> {
  final AmountInput = TextEditingController();
  final THB = 1.0;
  final Dollar = 0.031;
  final CNY = 0.022;
  final JPY = 5;
  final KRW = 46;

  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Exchange",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to the Currency Exchange App!",
              style: TextStyle(fontSize: 18, color: Colors.deepPurple[700]),
            ),

            TextFormField(
              controller: AmountInput,
              decoration: InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),

            // 2. สร้าง RadioListTile แต่ละรายการ
            RadioListTile<String>(
              title: const Text('Dollar'),
              value: 'Dollar',
              groupValue: _selectedOption, // ใช้ค่าร่วมกัน
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value; // อัปเดตค่าเมื่อเลือก
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('CNY'),
              value: 'CNY',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('JPY'),
              value: 'JPY',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('KRW'),
              value: 'KRW',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            Text('Selected: $_selectedOption'),

            ElevatedButton(
              onPressed: () {
                double amount = double.parse(AmountInput.text);
                double result = 0.0;

                if (_selectedOption == 'Dollar') {
                  result = amount * Dollar;
                } else if (_selectedOption == 'CNY') {
                  result = amount * CNY;
                } else if (_selectedOption == 'JPY') {
                  result = amount * JPY;
                } else if (_selectedOption == 'KRW') {
                  result = amount * KRW;
                }

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Conversion Result"),
                    content: Text(
                      "Converted Amount: ${result.toStringAsFixed(2)} ${_selectedOption}",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
