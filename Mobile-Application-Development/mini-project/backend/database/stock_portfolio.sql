-- Stock Portfolio Database Schema
-- สำหรับ MySQL Database

-- สร้าง Database
CREATE DATABASE IF NOT EXISTS stock_portfolio 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE stock_portfolio;

-- สร้าง Table สำหรับ Transactions
CREATE TABLE IF NOT EXISTS transactions (
    id VARCHAR(50) PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    exchange VARCHAR(20) NOT NULL,
    side ENUM('buy', 'sell') NOT NULL,
    executed_price DECIMAL(10, 3) NOT NULL,
    quantity DECIMAL(15, 7) NOT NULL,
    gross_amount DECIMAL(12, 2) NOT NULL,
    commission DECIMAL(8, 2) NOT NULL,
    vat DECIMAL(8, 4) NOT NULL,
    execution_datetime DATETIME NOT NULL,
    order_type ENUM('market', 'limit') NOT NULL,
    portfolio VARCHAR(50) NOT NULL,
    order_id VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_symbol (symbol),
    INDEX idx_side (side),
    INDEX idx_execution_datetime (execution_datetime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ใส่ข้อมูลตัวอย่าง (Mock Data)
INSERT INTO transactions (
    id, symbol, exchange, side, executed_price, quantity, gross_amount,
    commission, vat, execution_datetime, order_type, portfolio, order_id
) VALUES
(
    '1', 'NVDA', 'NASDAQ', 'buy', 187.848, 0.0901792, 16.94,
    0.03, 0.0020, '2026-01-27 22:04:00', 'market', 'Dime! USD', 'STKBMF20260127030403388805'
),
(
    '2', 'AAPL', 'NASDAQ', 'buy', 152.30, 0.5, 76.15,
    0.05, 0.0035, '2026-02-01 14:30:00', 'market', 'Dime! USD', 'STKBMF20260201073012345678'
),
(
    '3', 'GOOGL', 'NASDAQ', 'buy', 142.50, 0.25, 35.625,
    0.04, 0.0028, '2026-02-03 10:15:00', 'limit', 'Dime! USD', 'STKBMF20260203031523456789'
),
(
    '4', 'TSLA', 'NASDAQ', 'sell', 195.75, 0.1, 19.575,
    0.03, 0.0021, '2026-02-05 16:45:00', 'market', 'Dime! USD', 'STKBMF20260205094534567890'
);
