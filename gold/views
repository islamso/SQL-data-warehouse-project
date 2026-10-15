CREATE VIEW gold.dim_customers AS
  SELECT 
    ROW_NUMBER () OVER (ORDER BY cst_id ASC) AS customer_key ,
    cst_id AS customer_id ,
    cst_key AS customer_number ,
    cts_firstname AS first_name,
    cts_lastname AS last_name ,
    CASE WHEN cts_gndr != 'n/a' THEN cts_gndr
         ELSE COALESCE (GEN , 'n/a') END AS gender,
    CNTRY AS country ,
    BDATE AS birthdate,
    cts_marital_status AS marital_status ,
    cts_create_date AS create_date
    FROM silver.crm_cust_info
    LEFT JOIN silver.erp_CUST_AZ12
    ON silver.crm_cust_info.cst_key = silver.erp_CUST_AZ12.CID
    LEFT JOIN silver.erp_LOC_A101
    ON silver.crm_cust_info.cst_key = silver.erp_LOC_A101.CID

