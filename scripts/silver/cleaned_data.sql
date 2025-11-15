INSERT INTO silver.crm_cust_info(
		cst_id,
		cst_key,
		cst_firstname,
		cst_lastname,
		cst_marital_status,
		cst_gndr,
		cst_create_date)
SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
	 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
	 ELSE 'n/a'
END AS cst_marital_status,
CASE WHEN UPPER(cst_gndr) = 'F' THEN 'Female'
	 WHEN UPPER(cst_gndr) = 'M' THEN 'Male'
END AS cst_gndr,
cst_create_date
FROM
(
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date) AS flag_last
	FROM bronze.crm_cust_infos
	where cst_id is not null
)t WHERE flag_last = 1
