import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock_transaction.dart';

/// API Service สำหรับเชื่อมต่อกับ PHP Backend
class ApiService {
  // แก้ไข URL ตามที่คุณวางไฟล์ backend
  static const String baseUrl = 'http://localhost/stock_portfolio_api/api';
  
  /// ดึงรายการทั้งหมด
  Future<List<StockTransaction>> getAllTransactions() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/transactions.php'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final List transactionsList = data['data'];
          return transactionsList
              .map((json) => StockTransaction.fromJson(json))
              .toList();
        } else {
          throw Exception(data['message'] ?? 'Failed to load transactions');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }

  /// ดึงรายการเดียว
  Future<StockTransaction?> getTransactionById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/transactions.php?id=$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          return StockTransaction.fromJson(data['data']);
        }
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get transaction: $e');
    }
  }

  /// เพิ่มธุรกรรมใหม่
  Future<bool> addTransaction(StockTransaction transaction) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/transactions.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(transaction.toJson()),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return data['success'] == true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to add transaction: $e');
    }
  }

  /// แก้ไขธุรกรรม
  Future<bool> updateTransaction(StockTransaction transaction) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/transactions.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(transaction.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['success'] == true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to update transaction: $e');
    }
  }

  /// ลบธุรกรรม
  Future<bool> deleteTransaction(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/transactions.php?id=$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['success'] == true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to delete transaction: $e');
    }
  }
}
