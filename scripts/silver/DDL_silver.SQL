/* DDL script : create silver tables
Script purpose : this script creates tables in the 'silver' schema , dropping existing tables if they already exist.
Run this script to re define the DDL structure of 'bronze' tables. */


USE datawarehouse;

IF OBJECT_ID(N'silver.crm_cust_info', N'U') IS NOT NULL
   DROP TABLE silver.crm_cust_info ;
GO

    CREATE TABLE silver.crm_cust_info (
        cst_id INT ,
        cst_key NVARCHAR(50) ,
        cts_firstname NVARCHAR(50) ,
        cts_lastname NVARCHAR(50) ,
        cts_marital_status VARCHAR(50) ,
        cts_gndr NVARCHAR(10) ,
        cts_create_date DATE ,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
GO


IF OBJECT_ID(N'silver.crm_prd_info', N'U') IS NOT NULL
   DROP TABLE silver.crm_prd_info ;
BEGIN
    CREATE TABLE silver.crm_prd_info (
        prd_id INT ,
        prd_key NVARCHAR(50),
        prd_nm NVARCHAR(50),
        prd_cost DECIMAL(10, 2),
        prd_line NVARCHAR(50),
        prd_start_dt DATE ,
        prd_end_dt DATE,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
GO



IF OBJECT_ID(N'silver.crm_sales_details', N'U') IS NOT NULL
   DROP TABLE silver.crm_sales_details ;

GO
    CREATE TABLE silver.crm_sales_details (
        sls_ord_num NVARCHAR(50) ,
        sls_prd_key NVARCHAR(50) ,
        sls_cust_id INT , 
        sls_order_dt NVARCHAR(50) ,
        sls_ship_dt DATE ,
        sls_due_dt DATE ,
        sls_sales INT ,
        sls_quantity INT,
        sls_price DECIMAL(10, 2),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
GO



IF OBJECT_ID(N'silver.erp_CUST_AZ12', N'U') IS NOT NULL
   DROP TABLE silver.erp_CUST_AZ12 ;

GO
    CREATE TABLE silver.erp_CUST_AZ12 (
        CID NVARCHAR(50) ,
        BDATE DATE NULL,
        GEN NVARCHAR(50) NULL,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );

GO



IF OBJECT_ID(N'silver.erp_LOC_A101', N'U') IS NOT NULL
   DROP TABLE silver.erp_LOC_A101 ;

GO
    CREATE TABLE silver.erp_LOC_A101 (
        CID NVARCHAR(50) ,
        CNTRY NVARCHAR(50) ,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );

GO



IF OBJECT_ID(N'silver.erp_PX_CAT_G1V2', N'U') IS NOT NULL
   DROP TABLE silver.erp_PX_CAT_G1V2 ;

GO

    CREATE TABLE silver.erp_PX_CAT_G1V2 (
        ID NVARCHAR(50) , 
        CAT NVARCHAR(50) ,
        SUBCAT NVARCHAR(50) ,
        MAINTENANCE NVARCHAR(50) ,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
        
    );
GO




