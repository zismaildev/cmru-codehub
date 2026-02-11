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
      ),
      body: Consumer<StockProvider>(
        builder: (context, stockProvider, child) {
          final transactions = stockProvider.transactions;
          final totalInvested = stockProvider.totalInvested;

          if (transactions.isEmpty) {
            return const Center(
              child: Text(
                'ยังไม่มีธุรกรรม',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              // ===== Summary =====
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ยอดลงทุนรวม',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '\$${totalInvested.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3F51B5),
                      ),
                    ),
                  ],
                ),
              ),

              // ===== Transaction List =====
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    final isBuy =
                        transaction.side == TransactionSide.buy;
                    final dateFormat =
                        DateFormat('dd/MM/yyyy HH:mm');

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        leading: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: isBuy
                                ? Colors.green.withOpacity(0.12)
                                : Colors.red.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            isBuy
                                ? Icons.call_received
                                : Icons.call_made,
                            color:
                                isBuy ? Colors.green : Colors.red,
                          ),
                        ),
                        title: Text(
                          transaction.symbol,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding:
                              const EdgeInsets.only(top: 4),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${transaction.quantity.toStringAsFixed(2)} หุ้น @ \$${transaction.executedPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                dateFormat.format(
                                    transaction.executionDateTime),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Text(
                          '\$${transaction.netAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TransactionDetailScreen(
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
