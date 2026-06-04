-- ============================================================
-- Banking Database System — Sample Data
-- ============================================================

USE BankingDB;

-- Banks
INSERT INTO Bank (BankName, Address, Phone, Email) VALUES
('National Bank',     '10 Finance Street, London',    '+44-20-1234-5678', 'info@nationalbank.com'),
('City Bank',         '22 Commerce Ave, Manchester',  '+44-16-1234-5678', 'info@citybank.com'),
('Metro Bank',        '5 Capital Road, Birmingham',   '+44-12-1234-5678', 'info@metrobank.com');

-- Branches
INSERT INTO Branch (BankID, BranchName, Address, Phone) VALUES
(1, 'Central Branch',   '10 Finance Street, London',     '+44-20-1111-1111'),
(1, 'East Branch',      '45 East Road, London',          '+44-20-2222-2222'),
(2, 'North Branch',     '8 North Street, Manchester',    '+44-16-1111-1111'),
(3, 'West Branch',      '3 West Ave, Birmingham',        '+44-12-1111-1111');

-- Clients
INSERT INTO Client (BranchID, FirstName, LastName, Address, Phone, Email) VALUES
(101, 'Alice',   'Johnson', '12 Oak Lane, London',       '+44-77-1111-0001', 'alice@email.com'),
(101, 'Bob',     'Smith',   '34 Maple Ave, London',      '+44-77-1111-0002', 'bob@email.com'),
(102, 'Carol',   'Davis',   '56 Pine Rd, London',        '+44-77-1111-0003', 'carol@email.com'),
(103, 'David',   'Wilson',  '78 Elm St, Manchester',     '+44-77-1111-0004', 'david@email.com'),
(104, 'Eve',     'Brown',   '90 Cedar Blvd, Birmingham', '+44-77-1111-0005', 'eve@email.com');

-- Accounts
INSERT INTO Account (ClientID, AccountType, Balance) VALUES
(1001, 'Checking', 5500.00),
(1001, 'Savings',  12000.00),
(1002, 'Checking', 800.00),
(1003, 'Savings',  7500.00),
(1004, 'Checking', 3200.00),
(1005, 'Savings',  9800.00);

-- Transactions
INSERT INTO Transaction (SenderAccountID, ReceiverAccountID, Amount, Timestamp) VALUES
(10001, 10002, 200.00,  '2023-10-01 09:15:00'),
(10002, 10003, 150.50,  '2023-10-03 14:30:00'),
(10001, 10004, 500.00,  '2023-10-05 10:00:00'),
(10003, 10005, 1200.00, '2023-10-06 16:45:00'),
(10004, 10001, 300.00,  '2023-10-07 08:20:00');
