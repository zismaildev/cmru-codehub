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
  State<EditTransactionScreen> createState() =>
      _EditTransactionScreenState();
}

class _EditTransactionScreenState
    extends State<EditTransactionScreen> {

  final _formKey = GlobalKey<FormState>();

  // Form fields (logic เดิม)
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

    // Pre-fill ข้อมูลเดิม (logic เดิม)
    _symbol = widget.transaction.symbol;
    _exchange = widget.transaction.exchange;
    _side = widget.transaction.side;
    _executedPrice = widget.transaction.executedPrice;
    _quantity = widget.transaction.quantity;
    _commission = widget.transaction.commission;
    _vat = widget.transaction.vat;
    _executionDateTime =
        widget.transaction.executionDateTime;
    _orderType = widget.transaction.orderType;
    _portfolio = widget.transaction.portfolio;
  }

  // logic เดิม
  double get _grossAmount =>
      _executedPrice * _quantity;

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
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    /// CARD SYMBOL / EXCHANGE / SIDE
                    _card(
                      Column(
                        children: [

                          _field(
                            child: TextFormField(
                              initialValue: _symbol,
                              decoration:
                                  const InputDecoration(
                                labelText:
                                    'ชื่อหุ้น (Symbol)',
                                hintText:
                                    'เช่น AAPL, NVDA',
                              ),
                              validator: (v) =>
                                  v == null || v.isEmpty
                                      ? 'กรุณากรอกชื่อหุ้น'
                                      : null,
                              onSaved: (v) => _symbol =
                                  v!.toUpperCase(),
                            ),
                          ),

                          _gap(),

                          _field(
                            child:
                                DropdownButtonFormField<
                                    String>(
                              value: _exchange,
                              decoration:
                                  const InputDecoration(
                                labelText:
                                    'ตลาดหุ้น',
                              ),
                              items: [
                                'NASDAQ',
                                'NYSE',
                                'SET'
                              ]
                                  .map(
                                    (e) =>
                                        DropdownMenuItem(
                                      value: e,
                                      child:
                                          Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() =>
                                      _exchange = v!),
                            ),
                          ),

                          _gap(),

                          _field(
                            child:
                                DropdownButtonFormField<
                                    TransactionSide>(
                              value: _side,
                              decoration:
                                  const InputDecoration(
                                labelText:
                                    'ประเภท',
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value:
                                      TransactionSide
                                          .buy,
                                  child: Text(
                                      'ซื้อ (Buy)'),
                                ),
                                DropdownMenuItem(
                                  value:
                                      TransactionSide
                                          .sell,
                                  child: Text(
                                      'ขาย (Sell)'),
                                ),
                              ],
                              onChanged: (v) =>
                                  setState(() =>
                                      _side = v!),
                            ),
                          ),
                        ],
                      ),
                    ),

                    _gapLarge(),

                    /// CARD PRICE / QTY / COMMISSION / VAT
                    _card(
                      Column(
                        children: [

                          _numberField(
                            label:
                                'ราคาที่ได้ (USD)',
                            prefix: '\$ ',
                            initial:
                                _executedPrice
                                    .toString(),
                            onChanged: (v) =>
                                setState(() =>
                                    _executedPrice =
                                        double.tryParse(
                                                v) ??
                                            _executedPrice),
                          ),

                          _gap(),

                          _numberField(
                            label: 'จำนวนหุ้น',
                            initial:
                                _quantity
                                    .toString(),
                            onChanged: (v) =>
                                setState(() =>
                                    _quantity =
                                        double.tryParse(
                                                v) ??
                                            _quantity),
                          ),

                          _gap(),

                          _numberField(
                            label:
                                'ค่าคอมมิชชัน',
                            prefix: '\$ ',
                            initial:
                                _commission
                                    .toString(),
                            onChanged: (v) =>
                                setState(() =>
                                    _commission =
                                        double.tryParse(
                                                v) ??
                                            _commission),
                          ),

                          _gap(),

                          _numberField(
                            label: 'ภาษี 7%',
                            prefix: '\$ ',
                            initial:
                                _vat.toString(),
                            onChanged: (v) =>
                                setState(() =>
                                    _vat =
                                        double.tryParse(
                                                v) ??
                                            _vat),
                          ),
                        ],
                      ),
                    ),

                    _gapLarge(),

                    /// CARD SUMMARY
                    _card(
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [

                          const Text(
                            'สรุป',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                              height: 12),

                          _row(
                            'มูลค่าหุ้น',
                            '\$${_grossAmount.toStringAsFixed(2)}',
                          ),

                          _row(
                            'ค่าใช้จ่าย',
                            '\$${(_commission + _vat).toStringAsFixed(4)}',
                          ),

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

                    /// BUTTON SAVE
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            _updateTransaction,
                        child: const Text(
                            'บันทึกการแก้ไข'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  /// UI HELPERS (เหมือนหน้า Add 100%)

  Widget _card(Widget child) =>
      Container(
        padding:
            const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(12),
        ),
        child: child,
      );

  Widget _gap() =>
      const SizedBox(height: 12);

  Widget _gapLarge() =>
      const SizedBox(height: 20);

  Widget _field(
          {required Widget child}) =>
      child;

  Widget _numberField({
    required String label,
    String? prefix,
    String? initial,
    required Function(String)
        onChanged,
  }) {
    return TextFormField(
      initialValue: initial,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
      ),
      keyboardType:
          TextInputType.number,
      onChanged: onChanged,
    );
  }

  Widget _row(
    String l,
    String v, {
    bool bold = false,
    bool highlight = false,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
              vertical: 6),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
        children: [
          Text(l),
          Text(
            v,
            style: TextStyle(
              fontWeight: bold
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontSize:
                  bold ? 16 : 14,
              color: highlight
                  ? const Color(
                      0xFF3F51B5)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  /// LOGIC เดิม 100%
  Future<void>
      _updateTransaction() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(
        () => _isLoading = true);

    try {
      final updatedTransaction =
          StockTransaction(
        id: widget.transaction.id,
        symbol: _symbol,
        exchange: _exchange,
        side: _side,
        executedPrice:
            _executedPrice,
        quantity: _quantity,
        grossAmount:
            _grossAmount,
        commission:
            _commission,
        vat: _vat,
        executionDateTime:
            _executionDateTime,
        orderType:
            _orderType,
        portfolio:
            _portfolio,
        orderId: widget
            .transaction.orderId,
      );

      final provider =
          Provider.of<StockProvider>(
        context,
        listen: false,
      );

      await provider
          .updateTransaction(
              updatedTransaction);

      if (mounted) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content:
                Text('บันทึกสำเร็จ'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() =>
            _isLoading = false);

        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
                'เกิดข้อผิดพลาด: $e'),
          ),
        );
      }
    }
  }
}
