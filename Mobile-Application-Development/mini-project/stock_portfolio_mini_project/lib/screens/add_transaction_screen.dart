import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/stock_transaction.dart';
import '../providers/stock_provider.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  String _symbol = '';
  String _exchange = 'NASDAQ';
  TransactionSide _side = TransactionSide.buy;
  double _executedPrice = 0;
  double _quantity = 0;
  double _commission = 0.03;
  double _vat = 0.0021;
  DateTime _executionDateTime = DateTime.now();
  OrderType _orderType = OrderType.market;
  String _portfolio = 'Dime! USD';

  bool _isLoading = false;

  double get _grossAmount => _executedPrice * _quantity;

  double get _netAmount {
    if (_side == TransactionSide.buy) {
      return _grossAmount + _commission + _vat;
    } else {
      return _grossAmount - _commission - _vat;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มธุรกรรม'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _card(
                      Column(
                        children: [
                          _field(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'ชื่อหุ้น (Symbol)',
                                hintText: 'เช่น AAPL, NVDA',
                              ),
                              validator: (v) =>
                                  v == null || v.isEmpty ? 'กรุณากรอกชื่อหุ้น' : null,
                              onSaved: (v) => _symbol = v!.toUpperCase(),
                            ),
                          ),
                          _gap(),
                          _field(
                            child: DropdownButtonFormField<String>(
                              value: _exchange,
                              decoration: const InputDecoration(labelText: 'ตลาดหุ้น'),
                              items: ['NASDAQ', 'NYSE', 'SET']
                                  .map((e) =>
                                      DropdownMenuItem(value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (v) => setState(() => _exchange = v!),
                            ),
                          ),
                          _gap(),
                          _field(
                            child: DropdownButtonFormField<TransactionSide>(
                              value: _side,
                              decoration: const InputDecoration(labelText: 'ประเภท'),
                              items: const [
                                DropdownMenuItem(
                                  value: TransactionSide.buy,
                                  child: Text('ซื้อ (Buy)'),
                                ),
                                DropdownMenuItem(
                                  value: TransactionSide.sell,
                                  child: Text('ขาย (Sell)'),
                                ),
                              ],
                              onChanged: (v) => setState(() => _side = v!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _gapLarge(),
                    _card(
                      Column(
                        children: [
                          _numberField(
                            label: 'ราคาที่ได้ (USD)',
                            prefix: '\$ ',
                            onChanged: (v) =>
                                setState(() => _executedPrice = double.tryParse(v) ?? 0),
                          ),
                          _gap(),
                          _numberField(
                            label: 'จำนวนหุ้น',
                            onChanged: (v) =>
                                setState(() => _quantity = double.tryParse(v) ?? 0),
                          ),
                          _gap(),
                          _numberField(
                            label: 'ค่าคอมมิชชัน',
                            prefix: '\$ ',
                            initial: _commission.toString(),
                            onChanged: (v) =>
                                setState(() => _commission = double.tryParse(v) ?? 0.03),
                          ),
                          _gap(),
                          _numberField(
                            label: 'ภาษี 7%',
                            prefix: '\$ ',
                            initial: _vat.toString(),
                            onChanged: (v) =>
                                setState(() => _vat = double.tryParse(v) ?? 0.0021),
                          ),
                        ],
                      ),
                    ),
                    _gapLarge(),
                    _card(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('สรุป',
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          _row('มูลค่าหุ้น', '\$${_grossAmount.toStringAsFixed(2)}'),
                          _row('ค่าใช้จ่าย',
                              '\$${(_commission + _vat).toStringAsFixed(4)}'),
                          const Divider(),
                          _row(
                            'รวมยอด',
                            '\$${_netAmount.toStringAsFixed(2)}',
                            bold: true,
                            highlight: true,
                          ),
                        ],
                      ),
                    ),
                    _gapLarge(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _saveTransaction,
                        child: const Text('บันทึก'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _card(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      );

  Widget _gap() => const SizedBox(height: 12);
  Widget _gapLarge() => const SizedBox(height: 20);

  Widget _field({required Widget child}) => child;

  Widget _numberField({
    required String label,
    String? prefix,
    String? initial,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      initialValue: initial,
      decoration: InputDecoration(labelText: label, prefixText: prefix),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }

  Widget _row(String l, String v,
      {bool bold = false, bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(l),
          Text(
            v,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: bold ? 16 : 14,
              color: highlight ? const Color(0xFF3F51B5) : null,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    final transaction = StockTransaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      symbol: _symbol,
      exchange: _exchange,
      side: _side,
      executedPrice: _executedPrice,
      quantity: _quantity,
      grossAmount: _grossAmount,
      commission: _commission,
      vat: _vat,
      executionDateTime: _executionDateTime,
      orderType: _orderType,
      portfolio: _portfolio,
      orderId: 'STKBMF${DateTime.now().millisecondsSinceEpoch}',
    );

    await Provider.of<StockProvider>(context, listen: false)
        .addTransaction(transaction);

    if (mounted) Navigator.pop(context);
  }
}
