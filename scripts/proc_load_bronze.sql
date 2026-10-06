/* Stored procedure : Load bronze liar ( source ==> bronze)
Script purpose : this stored procedure loads data into the 'bronze' schema from external csv files.
It performs the following actions :
- Truncates the bronze tables before loading data .
- Uses the BULK insert command to load data from csv files to bronze tables.

Usage example : EXEC bronze.load_bronze; /*


USE datawarehouse;
GO
CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
    BEGIN TRY
        
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM '/tmp/datasets/source_crm/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM '/tmp/datasets/source_crm/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM '/tmp/datasets/source_crm/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.erp_CUST_AZ12;
        BULK INSERT bronze.erp_CUST_AZ12
        FROM '/tmp/datasets/source_erp/CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.erp_LOC_A101;
        BULK INSERT bronze.erp_LOC_A101
        FROM '/tmp/datasets/source_erp/LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM '/tmp/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while loading bronze layer.';
        PRINT ERROR_MESSAGE();
    END CATCH
END;

EXEC bronze.load_bronze;




