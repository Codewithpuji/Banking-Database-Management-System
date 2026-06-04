-- ============================================================
-- Banking Database System — Schema
-- MSc Data Analytics — Poojitha Kalyanam (2023)
-- University for the Creative Arts, Germany
-- Tool: MySQL Workbench
-- ============================================================

CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

-- ── Table 1: Bank ────────────────────────────────────────────
CREATE TABLE Bank (
    BankID      INT PRIMARY KEY AUTO_INCREMENT,
    BankName    VARCHAR(100) NOT NULL,
    Address     VARCHAR(255),
    Phone       VARCHAR(20),
    Email       VARCHAR(100)
);

-- ── Table 2: Branch ──────────────────────────────────────────
CREATE TABLE Branch (
    BranchID    INT PRIMARY KEY AUTO_INCREMENT,
    BankID      INT NOT NULL,
    BranchName  VARCHAR(100) NOT NULL,
    Address     VARCHAR(255),
    Phone       VARCHAR(20),
    FOREIGN KEY (BankID) REFERENCES Bank(BankID)
);

-- ── Table 3: Client ──────────────────────────────────────────
CREATE TABLE Client (
    ClientID    INT PRIMARY KEY AUTO_INCREMENT,
    BranchID    INT NOT NULL,
    FirstName   VARCHAR(50) NOT NULL,
    LastName    VARCHAR(50) NOT NULL,
    Address     VARCHAR(255),
    Phone       VARCHAR(20),
    Email       VARCHAR(100),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- ── Table 4: Account ─────────────────────────────────────────
CREATE TABLE Account (
    AccountID   INT PRIMARY KEY AUTO_INCREMENT,
    ClientID    INT NOT NULL,
    AccountType VARCHAR(20) NOT NULL,   -- 'Checking' or 'Savings'
    Balance     DECIMAL(15, 2) DEFAULT 0.00,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

-- ── Table 5: Transaction ─────────────────────────────────────
CREATE TABLE Transaction (
    TransactionID      INT PRIMARY KEY AUTO_INCREMENT,
    SenderAccountID    INT NOT NULL,
    ReceiverAccountID  INT NOT NULL,
    Amount             DECIMAL(15, 2) NOT NULL,
    Timestamp          DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderAccountID)   REFERENCES Account(AccountID),
    FOREIGN KEY (ReceiverAccountID) REFERENCES Account(AccountID)
);
