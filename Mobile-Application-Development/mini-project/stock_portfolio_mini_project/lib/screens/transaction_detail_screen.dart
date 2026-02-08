import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/stock_provider.dart';
import '../models/stock_transaction.dart';
import 'edit_transaction_screen.dart';

void _confirmDelete(BuildContext context, String transactionId) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('ยืนยันการลบ'),
        content: const Text('คุณต้องการลบธุรกรรมนี้หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              try {
                await Provider.of<StockProvider>(context, listen: false)
                    .deleteTransaction(transactionId);
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ลบสำเร็จ')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
                  );
                }
              }
            },
            child: const Text('ลบ', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

class TransactionDetailScreen extends StatelessWidget {
  final String transactionId;

  const TransactionDetailScreen({
    super.key,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    final transaction = stockProvider.getTransactionById(transactionId);

    if (transaction == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ไม่พบข้อมูล'),
        ),
        body: const Center(
          child: Text('ไม่พบธุรกรรมนี้'),
        ),
      );
    }

    final isBuy = transaction.side == TransactionSide.buy;
    final dateFormat = DateFormat('dd MMMM yyyy, HH:mm น.');

    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียด'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTransactionScreen(
                    transaction: transaction,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context, transaction.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ชื่อหุ้น
            Center(
              child: Column(
                children: [
                  Text(
                    transaction.symbol,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: isBuy ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isBuy ? 'ซื้อ' : 'ขาย',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // ข้อมูลหุ้น
            const Text(
              'ข้อมูลหุ้น',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('ชื่อหุ้น', transaction.symbol),
            _buildInfoRow('ตลาดหุ้น', transaction.exchange),
            _buildInfoRow('ประเภท', isBuy ? 'ซื้อ (Buy)' : 'ขาย (Sell)'),
            const Divider(height: 30),
            
            // ราคาและจำนวน
            const Text(
              'ราคาและจำนวน',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('ราคาที่ได้', '\$${transaction.executedPrice.toStringAsFixed(3)}'),
            _buildInfoRow('จำนวนหุ้น', '${transaction.quantity.toStringAsFixed(7)} หุ้น'),
            _buildInfoRow('มูลค่าหุ้น', '\$${transaction.grossAmount.toStringAsFixed(2)}'),
            const Divider(height: 30),
            
            // ค่าใช้จ่าย
            const Text(
              'ค่าใช้จ่าย',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('ค่าคอมมิชชัน', '\$${transaction.commission.toStringAsFixed(2)}'),
            _buildInfoRow('ภาษี 7%', '\$${transaction.vat.toStringAsFixed(4)}'),
            _buildInfoRow(
              'รวมยอดจ่าย',
              '\$${transaction.netAmount.toStringAsFixed(2)}',
              isHighlight: true,
            ),
            const Divider(height: 30),
            
            // ข้อมูลเพิ่มเติม
            const Text(
              'ข้อมูลเพิ่มเติม',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('วันที่', dateFormat.format(transaction.executionDateTime)),
            _buildInfoRow(
              'ประเภทคำสั่ง',
              transaction.orderType == OrderType.market ? 'ราคาตลาด' : 'กำหนดราคา',
            ),
            _buildInfoRow('บัญชี', transaction.portfolio),
            _buildInfoRow('เลขที่คำสั่ง', transaction.orderId),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: isHighlight ? 18 : 16,
                fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
                color: isHighlight ? Colors.blue : Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
