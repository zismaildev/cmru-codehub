<?php
// REST API สำหรับ Stock Transactions
require_once '../config/database.php';

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

$method = $_SERVER['REQUEST_METHOD'];

switch($method) {
    case 'GET':
        handleGet();
        break;
    case 'POST':
        handlePost();
        break;
    case 'PUT':
        handlePut();
        break;
    case 'DELETE':
        handleDelete();
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Method not allowed']);
}

// GET - ดึงข้อมูลทั้งหมดหรือ 1 รายการ
function handleGet() {
    global $pdo;
    
    try {
        if (isset($_GET['id'])) {
            // ดึงรายการเดียว
            $stmt = $pdo->prepare("SELECT * FROM transactions WHERE id = ?");
            $stmt->execute([$_GET['id']]);
            $transaction = $stmt->fetch();
            
            if ($transaction) {
                echo json_encode([
                    'success' => true,
                    'data' => formatTransaction($transaction)
                ]);
            } else {
                http_response_code(404);
                echo json_encode([
                    'success' => false,
                    'message' => 'Transaction not found'
                ]);
            }
        } else {
            // ดึงทั้งหมด
            $stmt = $pdo->query("SELECT * FROM transactions ORDER BY execution_datetime DESC");
            $transactions = $stmt->fetchAll();
            
            $formattedTransactions = array_map('formatTransaction', $transactions);
            
            echo json_encode([
                'success' => true,
                'data' => $formattedTransactions
            ]);
        }
    } catch(PDOException $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Database error: ' . $e->getMessage()
        ]);
    }
}

// POST - เพิ่มธุรกรรมใหม่
function handlePost() {
    global $pdo;
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    if (!validateTransaction($data)) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Invalid transaction data'
        ]);
        return;
    }
    
    try {
        $stmt = $pdo->prepare("
            INSERT INTO transactions (
                id, symbol, exchange, side, executed_price, quantity, gross_amount,
                commission, vat, execution_datetime, order_type, portfolio, order_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");
        
        $stmt->execute([
            $data['id'],
            $data['symbol'],
            $data['exchange'],
            $data['side'],
            $data['executedPrice'],
            $data['quantity'],
            $data['grossAmount'],
            $data['commission'],
            $data['vat'],
            $data['executionDateTime'],
            $data['orderType'],
            $data['portfolio'],
            $data['orderId']
        ]);
        
        http_response_code(201);
        echo json_encode([
            'success' => true,
            'message' => 'Transaction created successfully',
            'data' => ['id' => $data['id']]
        ]);
    } catch(PDOException $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Database error: ' . $e->getMessage()
        ]);
    }
}

// PUT - แก้ไขธุรกรรม
function handlePut() {
    global $pdo;
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    if (!isset($data['id']) || !validateTransaction($data)) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Invalid transaction data'
        ]);
        return;
    }
    
    try {
        $stmt = $pdo->prepare("
            UPDATE transactions SET
                symbol = ?, exchange = ?, side = ?, executed_price = ?,
                quantity = ?, gross_amount = ?, commission = ?, vat = ?,
                execution_datetime = ?, order_type = ?, portfolio = ?, order_id = ?
            WHERE id = ?
        ");
        
        $stmt->execute([
            $data['symbol'],
            $data['exchange'],
            $data['side'],
            $data['executedPrice'],
            $data['quantity'],
            $data['grossAmount'],
            $data['commission'],
            $data['vat'],
            $data['executionDateTime'],
            $data['orderType'],
            $data['portfolio'],
            $data['orderId'],
            $data['id']
        ]);
        
        if ($stmt->rowCount() > 0) {
            echo json_encode([
                'success' => true,
                'message' => 'Transaction updated successfully'
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                'success' => false,
                'message' => 'Transaction not found'
            ]);
        }
    } catch(PDOException $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Database error: ' . $e->getMessage()
        ]);
    }
}

// DELETE - ลบธุรกรรม
function handleDelete() {
    global $pdo;
    
    if (!isset($_GET['id'])) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Transaction ID required'
        ]);
        return;
    }
    
    try {
        $stmt = $pdo->prepare("DELETE FROM transactions WHERE id = ?");
        $stmt->execute([$_GET['id']]);
        
        if ($stmt->rowCount() > 0) {
            echo json_encode([
                'success' => true,
                'message' => 'Transaction deleted successfully'
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                'success' => false,
                'message' => 'Transaction not found'
            ]);
        }
    } catch(PDOException $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Database error: ' . $e->getMessage()
        ]);
    }
}

// Format transaction สำหรับ Flutter
function formatTransaction($row) {
    return [
        'id' => $row['id'],
        'symbol' => $row['symbol'],
        'exchange' => $row['exchange'],
        'side' => $row['side'],
        'executedPrice' => (float)$row['executed_price'],
        'quantity' => (float)$row['quantity'],
        'grossAmount' => (float)$row['gross_amount'],
        'commission' => (float)$row['commission'],
        'vat' => (float)$row['vat'],
        'executionDateTime' => $row['execution_datetime'],
        'orderType' => $row['order_type'],
        'portfolio' => $row['portfolio'],
        'orderId' => $row['order_id']
    ];
}

// Validate transaction data
function validateTransaction($data) {
    $required = ['id', 'symbol', 'exchange', 'side', 'executedPrice', 'quantity',
                 'grossAmount', 'commission', 'vat', 'executionDateTime',
                 'orderType', 'portfolio', 'orderId'];
    
    foreach ($required as $field) {
        if (!isset($data[$field])) {
            return false;
        }
    }
    
    if (!in_array($data['side'], ['buy', 'sell'])) {
        return false;
    }
    
    if (!in_array($data['orderType'], ['market', 'limit'])) {
        return false;
    }
    
    return true;
}
?>
