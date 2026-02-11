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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
            child: const Text(
              'ลบ',
              style: TextStyle(color: Colors.red),
            ),
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
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, transaction.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Header =====
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
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: isBuy
                          ? Colors.green.withOpacity(0.85)
                          : Colors.red.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isBuy ? 'ซื้อ' : 'ขาย',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            _section(
              title: 'ข้อมูลหุ้น',
              children: [
                _infoRow('ชื่อหุ้น', transaction.symbol),
                _infoRow('ตลาดหุ้น', transaction.exchange),
                _infoRow('ประเภท', isBuy ? 'ซื้อ (Buy)' : 'ขาย (Sell)'),
              ],
            ),

            _section(
              title: 'ราคาและจำนวน',
              children: [
                _infoRow(
                    'ราคาที่ได้',
                    '\$${transaction.executedPrice.toStringAsFixed(3)}'),
                _infoRow(
                    'จำนวนหุ้น',
                    '${transaction.quantity.toStringAsFixed(7)} หุ้น'),
                _infoRow(
                    'มูลค่าหุ้น',
                    '\$${transaction.grossAmount.toStringAsFixed(2)}'),
              ],
            ),

            _section(
              title: 'ค่าใช้จ่าย',
              children: [
                _infoRow(
                    'ค่าคอมมิชชัน',
                    '\$${transaction.commission.toStringAsFixed(2)}'),
                _infoRow(
                    'ภาษี 7%',
                    '\$${transaction.vat.toStringAsFixed(4)}'),
                _infoRow(
                  'รวมยอดจ่าย',
                  '\$${transaction.netAmount.toStringAsFixed(2)}',
                  highlight: true,
                ),
              ],
            ),

            _section(
              title: 'ข้อมูลเพิ่มเติม',
              children: [
                _infoRow(
                    'วันที่',
                    dateFormat.format(
                        transaction.executionDateTime)),
                _infoRow(
                  'ประเภทคำสั่ง',
                  transaction.orderType == OrderType.market
                      ? 'ราคาตลาด'
                      : 'กำหนดราคา',
                ),
                _infoRow('บัญชี', transaction.portfolio),
                _infoRow('เลขที่คำสั่ง', transaction.orderId),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value,
      {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: highlight ? 18 : 15,
                fontWeight:
                    highlight ? FontWeight.bold : FontWeight.normal,
                color:
                    highlight ? const Color(0xFF3F51B5) : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
