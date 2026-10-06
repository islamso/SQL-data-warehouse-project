/* DDL script : Create the bronze tables

Script purpose : this script creates tables in the bronze Schema if the tables doesn't already exists  */


USE datawarehouse;

IF OBJECT_ID(N'bronze.crm_cust_info', N'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_cust_info (
        cst_id INT PRIMARY KEY,
        cst_key NVARCHAR(50) ,
        cts_firstname NVARCHAR(50) ,
        cts_lastname NVARCHAR(50) ,
        cts_marital_status VARCHAR(50) ,
        cts_gndr NVARCHAR(10) ,
        cts_create_date DATE ,
    );
END;


IF OBJECT_ID(N'bronze.crm_prd_info', N'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_prd_info (
        prd_id INT PRIMARY KEY,
        prd_key NVARCHAR(50) ,
        prd_nm NVARCHAR(50) ,
        prd_cost DECIMAL(10, 2) ,
        prd_line NVARCHAR(50) ,
        prd_end_date DATE
    );
END;



IF OBJECT_ID(N'bronze.crm_sales_details', N'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_sales_details (
        sls_ord_num NVARCHAR(50) ,
        sls_prd_key NVARCHAR(50) ,
        sls_cst_id INT , 
        sls_order_dt DATE,
        sls_ship_dt DATE,
        sls_due_dt DATE,
        sls_sales INT ,
        sls_quantity INT ,
        sls_price DECIMAL(10, 2) ,
    );
END;
