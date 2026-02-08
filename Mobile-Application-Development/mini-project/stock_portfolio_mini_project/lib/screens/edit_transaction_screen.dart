import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/stock_transaction.dart';
import '../providers/stock_provider.dart';

class EditTransactionScreen extends StatefulWidget {
  final StockTransaction transaction;

  const EditTransactionScreen({
    super.key,
    required this.transaction,
  });

  @override
  State<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Form fields
  late String _symbol;
  late String _exchange;
  late TransactionSide _side;
  late double _executedPrice;
  late double _quantity;
  late double _commission;
  late double _vat;
  late DateTime _executionDateTime;
  late OrderType _orderType;
  late String _portfolio;
  
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill ข้อมูลเดิม
    _symbol = widget.transaction.symbol;
    _exchange = widget.transaction.exchange;
    _side = widget.transaction.side;
    _executedPrice = widget.transaction.executedPrice;
    _quantity = widget.transaction.quantity;
    _commission = widget.transaction.commission;
    _vat = widget.transaction.vat;
    _executionDateTime = widget.transaction.executionDateTime;
    _orderType = widget.transaction.orderType;
    _portfolio = widget.transaction.portfolio;
  }

  // คำนวณ Gross Amount
  double get _grossAmount => _executedPrice * _quantity;
  
  // คำนวณ Net Amount
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
        title: const Text('แก้ไขธุรกรรม'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Symbol
                    TextFormField(
                      initialValue: _symbol,
                      decoration: const InputDecoration(
                        labelText: 'ชื่อหุ้น (Symbol)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกชื่อหุ้น';
                        }
                        return null;
                      },
                      onSaved: (value) => _symbol = value!.toUpperCase(),
                    ),
                    const SizedBox(height: 16),

                    // Exchange
                    DropdownButtonFormField<String>(
                      value: _exchange,
                      decoration: const InputDecoration(labelText: 'ตลาดหุ้น'),
                      items: ['NASDAQ', 'NYSE', 'SET']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) => setState(() => _exchange = value!),
                    ),
                    const SizedBox(height: 16),

                    // Side (Buy/Sell)
                    DropdownButtonFormField<TransactionSide>(
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
                      onChanged: (value) => setState(() => _side = value!),
                    ),
                    const SizedBox(height: 16),

                    // Executed Price
                    TextFormField(
                      initialValue: _executedPrice.toString(),
                      decoration: const InputDecoration(
                        labelText: 'ราคาที่ได้ (USD)',
                        prefixText: '\$ ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกราคา';
                        }
                        if (double.tryParse(value) == null) {
                          return 'กรุณากรอกตัวเลข';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _executedPrice = double.tryParse(value) ?? _executedPrice;
                      }),
                    ),
                    const SizedBox(height: 16),

                    // Quantity
                    TextFormField(
                      initialValue: _quantity.toString(),
                      decoration: const InputDecoration(
                        labelText: 'จำนวนหุ้น',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกจำนวน';
                        }
                        if (double.tryParse(value) == null) {
                          return 'กรุณากรอกตัวเลข';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _quantity = double.tryParse(value) ?? _quantity;
                      }),
                    ),
                    const SizedBox(height: 16),

                    // Commission
                    TextFormField(
                      initialValue: _commission.toString(),
                      decoration: const InputDecoration(
                        labelText: 'ค่าคอมมิชชัน (USD)',
                        prefixText: '\$ ',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {
                        _commission = double.tryParse(value) ?? _commission;
                      }),
                    ),
                    const SizedBox(height: 16),

                    // VAT
                    TextFormField(
                      initialValue: _vat.toString(),
                      decoration: const InputDecoration(
                        labelText: 'ภาษี 7% (USD)',
                        prefixText: '\$ ',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {
                        _vat = double.tryParse(value) ?? _vat;
                      }),
                    ),
                    const SizedBox(height: 16),

                    // Execution DateTime
                    ListTile(
                      title: const Text('วันที่ทำรายการ'),
                      subtitle: Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(_executionDateTime),
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: _selectDateTime,
                    ),
                    const SizedBox(height: 16),

                    // Order Type
                    DropdownButtonFormField<OrderType>(
                      value: _orderType,
                      decoration: const InputDecoration(labelText: 'ประเภทคำสั่ง'),
                      items: const [
                        DropdownMenuItem(
                          value: OrderType.market,
                          child: Text('ราคาตลาด (Market)'),
                        ),
                        DropdownMenuItem(
                          value: OrderType.limit,
                          child: Text('กำหนดราคา (Limit)'),
                        ),
                      ],
                      onChanged: (value) => setState(() => _orderType = value!),
                    ),
                    const SizedBox(height: 24),

                    // Summary
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.blue[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'สรุป',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildSummaryRow('มูลค่าหุ้น', '\$${_grossAmount.toStringAsFixed(2)}'),
                          _buildSummaryRow('ค่าใช้จ่าย', '\$${(_commission + _vat).toStringAsFixed(4)}'),
                          const Divider(),
                          _buildSummaryRow(
                            'รวมยอด',
                            '\$${_netAmount.toStringAsFixed(2)}',
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _updateTransaction,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Text(
                          'บันทึกการแก้ไข',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _executionDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_executionDateTime),
      );

      if (time != null) {
        setState(() {
          _executionDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _updateTransaction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    try {
      final updatedTransaction = StockTransaction(
        id: widget.transaction.id,
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
        orderId: widget.transaction.orderId,
      );

      final provider = Provider.of<StockProvider>(context, listen: false);
      await provider.updateTransaction(updatedTransaction);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('บันทึกสำเร็จ')),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
        );
      }
    }
  }
}
