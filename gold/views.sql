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



------------------------------------------------
CREATE VIEW gold.fact_sales AS
    SELECT 
        sls_ord_num AS order_number,
        product_key ,
        customer_key ,
        sls_order_dt AS order_date,
        sls_ship_dt AS shipping_date ,
        sls_due_dt AS due_date ,
        sls_sales AS sales_amount ,
        sls_quantity AS quantity,
        sls_price AS price
    FROM silver.crm_sales_details
    LEFT JOIN gold.dim_products
    ON silver.crm_sales_details.sls_prd_key = gold.dim_products.product_number
    LEFT JOIN gold.dim_customers
    ON silver.crm_sales_details.sls_cust_id = gold.dim_customers.customer_id


