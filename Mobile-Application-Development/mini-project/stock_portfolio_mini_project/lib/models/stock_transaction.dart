/// Stock Transaction Model
/// 
/// Model สำหรับเก็บข้อมูลการซื้อขายหุ้นแต่ละธุรกรรม
class StockTransaction {
  final String id; // Unique ID สำหรับแต่ละธุรกรรม
  final String symbol; // ชื่อหุ้น เช่น NVDA, AAPL
  final String exchange; // ตลาดหุ้น เช่น NASDAQ, NYSE
  final TransactionSide side; // ซื้อหรือขาย
  final double executedPrice; // ราคาที่ได้จริง (USD)
  final double quantity; // จำนวนหุ้น (รองรับทศนิยม)
  final double grossAmount; // มูลค่าหุ้นที่ซื้อ/ขาย (USD)
  final double commission; // ค่าคอมมิชชัน (USD)
  final double vat; // ภาษีมูลค่าเพิ่ม 7% (USD)
  final DateTime executionDateTime; // วันที่และเวลาที่สำเร็จ
  final OrderType orderType; // ประเภทคำสั่ง (Market/Limit)
  final String portfolio; // บัญชี/พอร์ตที่ใช้
  final String orderId; // เลขที่คำสั่ง

  StockTransaction({
    required this.id,
    required this.symbol,
    required this.exchange,
    required this.side,
    required this.executedPrice,
    required this.quantity,
    required this.grossAmount,
    required this.commission,
    required this.vat,
    required this.executionDateTime,
    required this.orderType,
    required this.portfolio,
    required this.orderId,
  });

  /// คำนวณ Net Amount (รวมยอดเงินที่จ่ายหรือได้รับจริง)
  /// - ซื้อ (Buy): Net Amount = Gross Amount + Commission + VAT (ต้องจ่าย)
  /// - ขาย (Sell): Net Amount = Gross Amount - Commission - VAT (ได้รับ)
  double get netAmount {
    if (side == TransactionSide.buy) {
      return grossAmount + commission + vat;
    } else {
      return grossAmount - commission - vat;
    }
  }

  /// สำหรับแปลงเป็น JSON (ใช้เมื่อต่อ Database)
  /// 
  /// TODO [DATABASE]: ใช้ฟังก์ชันนี้เมื่อบันทึกข้อมูลลง Database
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'exchange': exchange,
      'side': side.toString().split('.').last,
      'executedPrice': executedPrice,
      'quantity': quantity,
      'grossAmount': grossAmount,
      'commission': commission,
      'vat': vat,
      'executionDateTime': executionDateTime.toIso8601String(),
      'orderType': orderType.toString().split('.').last,
      'portfolio': portfolio,
      'orderId': orderId,
    };
  }

  /// สร้าง StockTransaction จาก JSON (ใช้เมื่อดึงข้อมูลจาก Database)
  /// 
  /// TODO [DATABASE]: ใช้ฟังก์ชันนี้เมื่ออ่านข้อมูลจาก Database
  factory StockTransaction.fromJson(Map<String, dynamic> json) {
    return StockTransaction(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      exchange: json['exchange'] as String,
      side: TransactionSide.values.firstWhere(
        (e) => e.toString().split('.').last == json['side'],
      ),
      executedPrice: (json['executedPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      grossAmount: (json['grossAmount'] as num).toDouble(),
      commission: (json['commission'] as num).toDouble(),
      vat: (json['vat'] as num).toDouble(),
      executionDateTime: DateTime.parse(json['executionDateTime'] as String),
      orderType: OrderType.values.firstWhere(
        (e) => e.toString().split('.').last == json['orderType'],
      ),
      portfolio: json['portfolio'] as String,
      orderId: json['orderId'] as String,
    );
  }

  /// สำหรับ copy object พร้อมแก้ไขบางค่า
  StockTransaction copyWith({
    String? id,
    String? symbol,
    String? exchange,
    TransactionSide? side,
    double? executedPrice,
    double? quantity,
    double? grossAmount,
    double? commission,
    double? vat,
    DateTime? executionDateTime,
    OrderType? orderType,
    String? portfolio,
    String? orderId,
  }) {
    return StockTransaction(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      exchange: exchange ?? this.exchange,
      side: side ?? this.side,
      executedPrice: executedPrice ?? this.executedPrice,
      quantity: quantity ?? this.quantity,
      grossAmount: grossAmount ?? this.grossAmount,
      commission: commission ?? this.commission,
      vat: vat ?? this.vat,
      executionDateTime: executionDateTime ?? this.executionDateTime,
      orderType: orderType ?? this.orderType,
      portfolio: portfolio ?? this.portfolio,
      orderId: orderId ?? this.orderId,
    );
  }
}

/// ประเภทการซื้อขาย
enum TransactionSide {
  buy, // ซื้อ
  sell, // ขาย
}

/// ประเภทคำสั่งซื้อ
enum OrderType {
  market, // ราคาตลาด
  limit, // กำหนดราคา
}
