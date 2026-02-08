import 'package:flutter/foundation.dart';
import '../models/stock_transaction.dart';
import '../services/api_service.dart';

/// Stock Provider
/// 
/// จัดการ State ของแอป รวมถึงรายการธุรกรรมทั้งหมด
/// เชื่อมต่อกับ PHP MySQL Backend ผ่าน ApiService
class StockProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  // รายการธุรกรรมทั้งหมด
  List<StockTransaction> _transactions = [];
  
  // Loading state
  bool _isLoading = false;
  
  // Error message
  String? _errorMessage;
  
  /// Constructor - โหลดข้อมูลตอนเริ่มต้น
  StockProvider() {
    loadTransactions();
  }

  /// ดึงรายการธุรกรรมทั้งหมด
  List<StockTransaction> get transactions => _transactions;
  
  /// Loading state
  bool get isLoading => _isLoading;
  
  /// Error message
  String? get errorMessage => _errorMessage;

  /// ดึงธุรกรรมตาม ID
  StockTransaction? getTransactionById(String id) {
    try {
      return _transactions.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  /// คำนวณยอดเงินลงทุนสุทธิ (Buy - Sell)
  /// - ซื้อ (Buy): ลบเงิน (ใช้ไปเท่าไหร่)
  /// - ขาย (Sell): บวกเงิน (ได้กลับมาเท่าไหร่)
  double get totalInvested {
    return _transactions.fold(0.0, (sum, t) {
      if (t.side == TransactionSide.buy) {
        return sum + t.netAmount; // ลบเงินที่ใช้ไป
      } else {
        return sum - t.netAmount; // บวกเงินที่ได้กลับมา
      }
    });
  }

  /// คำนวณจำนวนธุรกรรมทั้งหมด
  int get totalTransactions => _transactions.length;

  // ========================================
  // TODO [DATABASE]: ฟังก์ชันด้านล่างนี้พร้อมสำหรับต่อ Database แล้ว
  // ให้เรียกใช้ StockStorageService ในแต่ละฟังก์ชัน
  // ========================================

  /// เพิ่มธุรกรรมใหม่
  Future<void> addTransaction(StockTransaction transaction) async {
    try {
      final success = await _apiService.addTransaction(transaction);
      if (success) {
        _transactions.add(transaction);
        notifyListeners();
      } else {
        throw Exception('Failed to add transaction');
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  /// ลบธุรกรรม
  Future<void> deleteTransaction(String id) async {
    try {
      final success = await _apiService.deleteTransaction(id);
      if (success) {
        _transactions.removeWhere((t) => t.id == id);
        notifyListeners();
      } else {
        throw Exception('Failed to delete transaction');
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  /// อัปเดตธุรกรรม
  Future<void> updateTransaction(StockTransaction transaction) async {
    try {
      final success = await _apiService.updateTransaction(transaction);
      if (success) {
        final index = _transactions.indexWhere((t) => t.id == transaction.id);
        if (index != -1) {
          _transactions[index] = transaction;
          notifyListeners();
        }
      } else {
        throw Exception('Failed to update transaction');
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  /// โหลดข้อมูลทั้งหมดจาก Database (API)
  Future<void> loadTransactions() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _transactions = await _apiService.getAllTransactions();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      _transactions = [];
      notifyListeners();
    }
  }
}

// ========================================
// Mock Data สำหรับ Demo
// ========================================
/// สร้าง Mock Transactions สำหรับ demo
/// 
/// TODO [DATABASE]: ลบฟังก์ชันนี้เมื่อเชื่อม Database แล้ว
List<StockTransaction> _getMockTransactions() {
  return [
    StockTransaction(
      id: '1',
      symbol: 'NVDA',
      exchange: 'NASDAQ',
      side: TransactionSide.buy,
      executedPrice: 187.848,
      quantity: 0.0901792,
      grossAmount: 16.94,
      commission: 0.03,
      vat: 0.0020,
      executionDateTime: DateTime(2026, 1, 27, 22, 4),
      orderType: OrderType.market,
      portfolio: 'Dime! USD',
      orderId: 'STKBMF20260127030403388805',
    ),
    StockTransaction(
      id: '2',
      symbol: 'AAPL',
      exchange: 'NASDAQ',
      side: TransactionSide.buy,
      executedPrice: 152.30,
      quantity: 0.5,
      grossAmount: 76.15,
      commission: 0.05,
      vat: 0.0035,
      executionDateTime: DateTime(2026, 2, 1, 14, 30),
      orderType: OrderType.market,
      portfolio: 'Dime! USD',
      orderId: 'STKBMF20260201073012345678',
    ),
    StockTransaction(
      id: '3',
      symbol: 'GOOGL',
      exchange: 'NASDAQ',
      side: TransactionSide.buy,
      executedPrice: 142.50,
      quantity: 0.25,
      grossAmount: 35.625,
      commission: 0.04,
      vat: 0.0028,
      executionDateTime: DateTime(2026, 2, 3, 10, 15),
      orderType: OrderType.limit,
      portfolio: 'Dime! USD',
      orderId: 'STKBMF20260203031523456789',
    ),
    StockTransaction(
      id: '4',
      symbol: 'TSLA',
      exchange: 'NASDAQ',
      side: TransactionSide.sell,
      executedPrice: 195.75,
      quantity: 0.1,
      grossAmount: 19.575,
      commission: 0.03,
      vat: 0.0021,
      executionDateTime: DateTime(2026, 2, 5, 16, 45),
      orderType: OrderType.market,
      portfolio: 'Dime! USD',
      orderId: 'STKBMF20260205094534567890',
    ),
  ];
}
