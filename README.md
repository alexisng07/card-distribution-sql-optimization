# 🂡 Playing Cards + SQL Optimization Test

This project is a combined solution for a programming and SQL performance test, including:

- 🎴 PHP + jQuery Card Distribution App
- 🐬 MySQL Query Optimization with Benchmark
- 🐳 Dockerized Environment (PHP, MySQL, Nginx)

---

## ⚙️ Requirements

- Docker
- Docker Compose

---

## 🚀 Setup & Run

```bash
# Clone or download
git clone https://github.com/alexisng07/card-distribution-sql-optimization.git
cd card-distribution-sql-optimization

# Build containers
docker-compose up -d
```

### Access the App:

- 🂡 Card Distributor: http://localhost
- 🧪 SQL Optimizer: http://localhost/sql_optimize.php

---

## 🧪 SQL Optimization Demo

Added `FULLTEXT` indexes to:
- `jobs.name`, `description`, `detail`, `remarks`, etc.
- `job_categories.name`
- `job_types.name`
- `personalities.name`
- `practical_skills.name`
- `affiliates.name`

And replaced `LIKE` with `MATCH ... AGAINST`.

---

## 🗂 Sample Data

- 10 rows of realistic `jobs`
- Related `job_categories`, `job_types`, `affiliates`, etc.
- Japanese keywords like `キャビンアテンダント` to simulate real filtering

---

## 🔍 Tech Stack

- PHP 8.1
- MySQL 5.7 (utf8mb4)
- Docker & Docker Compose
- jQuery + HTML frontend

---

## 🧹 Cleanup

```bash
docker-compose down -v
```

This stops and removes containers and volumes.

---

## 📬 Contact

This solution was developed as part of a technical test. For questions or improvements, feel free to fork or raise an issue.
