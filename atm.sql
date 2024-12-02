CREATE DATABASE atm;
CREATE TABLE users (
    user_id INT PRIMARY KEY NOT NULL,
    user_name VARCHAR(60) NOT NULL,
    user_surname VARCHAR(50) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    phone_number VARCHAR(40) NOT NULL,
    adress VARCHAR(60) NOT NULL
)
CREATE TABLE accounts(
    account_id INT PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    account_type ENUM("current account","saving account","foreign currency account") NOT NULL,
    balance DECIMAL(20,2) NOT NULL,
    account_opening_date DATE NOT NULL

)

CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY NOT NULL,
    account_id INT NOT NULL,
    type_of_transaction ENUM("payment","disbursement") NOT NULL,
    amount DECIMAL(20,2) NOT NULL,
    date_of_transaction TIMESTAMP NOT NULL,
    description_of_transaction TEXT NOT NULL
)

CREATE TABLE atms(
    atm_id INT PRIMARY KEY NOT NULL,
    atm_location TEXT NOT NULL,
    atm_status ENUM("active","inactive")
)
CREATE TABLE atm_logs(
    log_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    atm_id INT NOT NULL,
    user_id INT NOT NULL,
    transaction_id INT NOT NULL,
    activity_time TIMESTAMP NOT NULL
)
CREATE INDEX idx_user_name_surname ON users (user_name, user_surname);
