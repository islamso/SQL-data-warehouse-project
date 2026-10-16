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


--------------------------------------

CREATE VIEW gold.dim_product AS
SELECT ROW_NUMBER() OVER (ORDER BY cat_id) AS gold_id,
prd_id AS product_id,
prd_key AS product_NUMBER ,
prd_nm AS product_name ,
cat_id AS category_id , 
CAT AS category ,
SUBCAT AS subcategory ,
MAINTENANCE AS maintenance,
prd_cost AS cost,
prd_line AS product_line ,
prd_start_dt AS startdate
FROM silver.crm_prd_info 
LEFT JOIN silver.erp_PX_CAT_G1V2
ON silver.crm_prd_info.cat_id = silver.erp_PX_CAT_G1V2.ID  
WHERE prd_end_dt IS NULL  


