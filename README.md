# 🏦 Banking Database Management System
**MSc Data Analytics Project — Poojitha Kalyanam (2023)**

Relational database system designed and implemented for a multi-entity banking environment. Covers full schema design, entity-relationship modelling, SQL query optimisation, ACID compliance, and CAP theorem analysis.

---

## 📐 Schema Design

Five interconnected entities with enforced foreign key relationships:

```
Bank ──< Branch ──< Client ──< Account ──< Transaction
(1:M)    (1:M)      (1:M)       (1:M)
```

| Table | Primary Key | Foreign Keys | Key Attributes |
|---|---|---|---|
| **Bank** | BankID | — | BankName, Address, Phone, Email |
| **Branch** | BranchID | BankID | BranchName, Address, Phone |
| **Client** | ClientID | BranchID | FirstName, LastName, Address, Phone, Email |
| **Account** | AccountID | ClientID | AccountType, Balance |
| **Transaction** | TransactionID | SenderAccountID, ReceiverAccountID | Amount, Timestamp |

---

## 🗃️ SQL Queries Covered

| # | Query | Techniques |
|---|---|---|
| 1 | All clients of a specific branch | `WHERE`, filter |
| 2 | Accounts with balance > 1000 | `WHERE`, comparison |
| 3 | Latest transaction for an account | `WHERE`, `ORDER BY`, `LIMIT` |
| 4 | Total balance for a client | `SUM()`, aggregation |
| 5 | Names and addresses of all banks | `SELECT`, projection |
| 6 | Branch count per bank | `INNER JOIN`, `COUNT()`, `GROUP BY` |
| 7 | Average balance of checking accounts | `AVG()`, `WHERE` filter |
| 8 | All branches with bank names | `INNER JOIN` |
| 9 | Transactions on or after a date | `WHERE`, date filtering |
| 10 | Clients with balance over 7000 | `INNER JOIN`, threshold filter |
| 11 | Total banks and branches in system | Correlated subqueries |
| 12 | Clients with no accounts | `LEFT JOIN`, `IS NULL` |

---

## 🔐 Why RDBMS over NoSQL

| Factor | Reasoning |
|---|---|
| **Structured data** | Banking entities have fixed schemas — tables map directly |
| **ACID compliance** | Atomicity, Consistency, Isolation, Durability guarantee transaction integrity |
| **Complex queries** | JOINs, aggregations, and subqueries are native to SQL |
| **Data relationships** | Foreign key constraints enforce referential integrity across all entities |
| **Schema enforcement** | Predefined schemas prevent inconsistencies in regulated financial data |

---

## ⚖️ CAP Theorem Analysis

The CAP theorem states that a distributed system can only guarantee **two of three** properties simultaneously: **Consistency**, **Availability**, **Partition Tolerance**.

| Combination | Behaviour | Examples |
|---|---|---|
| **CA** | Prioritises consistency + availability; may fail during network partition | Traditional RDBMS |
| **AP** | Prioritises availability + partition tolerance; may return stale data | Cassandra, CouchDB |
| **CP** | Prioritises consistency + partition tolerance; may be unavailable during partition | Redis, MongoDB, HBase |

**Decision for this project:** RDBMS (CA) — banking requires strict consistency and data integrity. The structured schema, complex query requirements, and regulatory compliance outweigh the horizontal scalability advantages of NoSQL.

---

## 🛠️ Tech Stack

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-003B57?style=flat&logo=sqlite&logoColor=white)

**Tool:** MySQL Workbench  
**Language:** SQL (DDL + DML)  
**Concepts:** Relational schema design · Foreign key constraints · ACID compliance · INNER JOIN · LEFT JOIN · Aggregations · Subqueries · CAP theorem

---

## 📁 Repository Structure

```
Banking-DBMS/
│
├── schema.sql        # CREATE TABLE statements for all 5 entities
├── sample_data.sql   # INSERT statements with sample banking data
├── queries.sql       # All 12 SQL queries with comments
└── README.md
```

---

## 🚀 How to Run

**Requirements:** MySQL Workbench or any MySQL-compatible client (MySQL 8.0+)

**1. Clone the repo**
```bash
git clone https://github.com/Codewithpuji/Banking-DBMS.git
cd Banking-DBMS
```

**2. Run in MySQL Workbench**
- Open MySQL Workbench → connect to your local server
- Open each file in order and execute:
```
1. schema.sql       ← creates the database and all tables
2. sample_data.sql  ← populates tables with sample records
3. queries.sql      ← run individual queries to explore the data
```

**Or via MySQL CLI:**
```bash
mysql -u root -p < schema.sql
mysql -u root -p BankingDB < sample_data.sql
mysql -u root -p BankingDB < queries.sql
```

---

## 🔍 Entity-Relationship Summary

```
Bank
 └── Branch (many branches per bank)
      └── Client (many clients per branch)
           └── Account (many accounts per client — Checking / Savings)
                └── Transaction (many transactions per account, sender + receiver)
```

Each entity enforces referential integrity via foreign key constraints. Transactions reference accounts twice (sender and receiver), enabling full audit trail tracking of all fund movements.

---

## 📚 Research Context

Completed as part of the **MSc Data Analytics** programme at the **University for the Creative Arts, Germany (2023)**. Demonstrates relational database design for financial systems, including schema normalisation, query optimisation, ACID compliance, and distributed system trade-off analysis using the CAP theorem.

---

## 👩‍💻 Author

**Poojitha Kalyanam** — Data Analyst | MSc Data Analytics  
📍 Berlin, Germany  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/poojitha-kalyanam)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/Codewithpuji)
