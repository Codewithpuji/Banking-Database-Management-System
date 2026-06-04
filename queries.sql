-- ============================================================
-- Banking Database System — SQL Queries
-- MSc Data Analytics — Poojitha Kalyanam (2023)
-- ============================================================

USE BankingDB;

-- ── Query 1: Retrieve all clients of a specific branch ───────
SELECT *
FROM Client
WHERE BranchID = 102;

-- ── Query 2: List accounts with balance greater than 1000 ────
SELECT *
FROM Account
WHERE Balance > 1000.00;

-- ── Query 3: Find the latest transaction for a given account ─
SELECT *
FROM Transaction
WHERE SenderAccountID = 10001
   OR ReceiverAccountID = 10001
ORDER BY Timestamp DESC
LIMIT 1;

-- ── Query 4: Calculate total balance for a specific client ───
SELECT SUM(Balance) AS TotalBalance
FROM Account
WHERE ClientID = 1005;

-- ── Query 5: Retrieve names and addresses of all banks ───────
SELECT BankName, Address
FROM Bank;

-- ── Query 6: List branches with their respective banks ───────
SELECT BK.BankName, COUNT(B.BranchID) AS TotalBranches
FROM Branch B
INNER JOIN Bank BK ON B.BankID = BK.BankID
GROUP BY BK.BankName;

-- ── Query 7: Find average balance of checking accounts ───────
SELECT AVG(Balance) AS AverageCheckingBalance
FROM Account
WHERE AccountType = 'Checking';

-- ── Query 8: List all branches with their bank names ─────────
SELECT B.BranchName, BK.BankName
FROM Branch B
INNER JOIN Bank BK ON B.BankID = BK.BankID;

-- ── Query 9: List transactions on or after a specific date ───
SELECT TransactionID, SenderAccountID, ReceiverAccountID, Amount, Timestamp
FROM Transaction
WHERE Timestamp >= '2023-10-05';

-- ── Query 10: Find clients with account balance over 7000 ────
SELECT C.FirstName, C.LastName
FROM Client C
INNER JOIN Account A ON C.ClientID = A.ClientID
WHERE A.Balance > 7000.00;

-- ── Query 11: Total number of banks and branches in system ───
SELECT
    (SELECT COUNT(DISTINCT BankID)   FROM Bank)   AS TotalBanks,
    (SELECT COUNT(DISTINCT BranchID) FROM Branch) AS TotalBranches;

-- ── Query 12: List clients with no accounts ──────────────────
SELECT C.FirstName, C.LastName
FROM Client C
LEFT JOIN Account A ON C.ClientID = A.ClientID
WHERE A.ClientID IS NULL;
