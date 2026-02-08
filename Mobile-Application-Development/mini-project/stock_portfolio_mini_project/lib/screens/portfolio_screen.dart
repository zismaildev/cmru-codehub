import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/stock_provider.dart';
import '../models/stock_transaction.dart';
import 'transaction_detail_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการธุรกรรม'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Consumer<StockProvider>(
        builder: (context, stockProvider, child) {
          final transactions = stockProvider.transactions;
          final totalInvested = stockProvider.totalInvested;

          if (transactions.isEmpty) {
            return const Center(
              child: Text('ยังไม่มีธุรกรรม'),
            );
          }

          return Column(
            children: [
              // แสดงยอดรวม
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ยอดลงทุนรวม:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '\$${totalInvested.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              // รายการธุรกรรม
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    final isBuy = transaction.side == TransactionSide.buy;
                    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: Icon(
                          isBuy ? Icons.arrow_downward : Icons.arrow_upward,
                          color: isBuy ? Colors.green : Colors.red,
                          size: 30,
                        ),
                        title: Text(
                          transaction.symbol,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${transaction.quantity.toStringAsFixed(2)} หุ้น @ \$${transaction.executedPrice.toStringAsFixed(2)}'),
                            Text(dateFormat.format(transaction.executionDateTime)),
                          ],
                        ),
                        trailing: Text(
                          '\$${transaction.netAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailScreen(
                                transactionId: transaction.id,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

