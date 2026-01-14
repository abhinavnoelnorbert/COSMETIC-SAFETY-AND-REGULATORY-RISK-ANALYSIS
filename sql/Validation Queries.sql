DROP TABLE cscp_cleaned;

CREATE TABLE cscp_cleaned (
    CDPHId BIGINT NOT NULL,
    ProductName TEXT,
    CSFId TEXT,
    CSF TEXT,
    CompanyId BIGINT NOT NULL,
    CompanyName TEXT,
    BrandName TEXT,
    PrimaryCategoryId BIGINT,
    PrimaryCategory TEXT,
    SubCategoryId BIGINT,
    SubCategory TEXT,
    CasId BIGINT,
    CasNumber VARCHAR(50),
    ChemicalId BIGINT NOT NULL,
    ChemicalName TEXT,
    InitialDateReported DATE NOT NULL,
    MostRecentDateReported DATE NOT NULL,
    DiscontinuedDate DATE,
    ChemicalCreatedAt TEXT,
    ChemicalUpdatedAt DATETIME NOT NULL,
    ChemicalDateRemoved DATE,
    ChemicalCount BIGINT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cscp_cleaned_v1.csv'
INTO TABLE cscp_cleaned
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 CDPHId,
 ProductName,
 CSFId,
 CSF,
 CompanyId,
 CompanyName,
 BrandName,
 PrimaryCategoryId,
 PrimaryCategory,
 SubCategoryId,
 SubCategory,
 CasId,
 CasNumber,
 ChemicalId,
 ChemicalName,
 InitialDateReported,
 MostRecentDateReported,
 @DiscontinuedDate,
 ChemicalCreatedAt,
 ChemicalUpdatedAt,
 @ChemicalDateRemoved,
 ChemicalCount
)
SET 
  CasNumber = NULLIF(CasNumber, ''),
  DiscontinuedDate = NULLIF(@DiscontinuedDate, ''),
  ChemicalDateRemoved = NULLIF(@ChemicalDateRemoved, '');

SELECT COUNT(*) FROM cscp_cleaned;
SELECT COUNT(DISTINCT CDPHId), COUNT(DISTINCT ChemicalId) FROM cscp_cleaned;
SELECT COUNT(*) FROM cscp_cleaned WHERE CasNumber IS NULL;

SELECT 
    CDPHId,
    COUNT(DISTINCT ChemicalId) AS chem_count
FROM cscp_cleaned
GROUP BY CDPHId;

SELECT
    COUNT(*) AS total_products,
    AVG(chem_count) AS avg_chemicals_per_product,
    MIN(chem_count) AS min_chemicals,
    MAX(chem_count) AS max_chemicals
FROM (
    SELECT 
        CDPHId,
        COUNT(DISTINCT ChemicalId) AS chem_count
    FROM cscp_cleaned
    GROUP BY CDPHId
) t;

SELECT 
    AVG(chem_count) AS median_chemicals
FROM (
    SELECT 
        chem_count,
        ROW_NUMBER() OVER (ORDER BY chem_count) AS rn,
        COUNT(*) OVER () AS total_rows
    FROM (
        SELECT 
            CDPHId,
            COUNT(DISTINCT ChemicalId) AS chem_count
        FROM cscp_cleaned
        GROUP BY CDPHId
    ) x
) y
WHERE rn IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2));

SELECT
    ChemicalId,
    ChemicalName,
    COUNT(DISTINCT CDPHId) AS product_count
FROM cscp_cleaned
GROUP BY ChemicalId, ChemicalName
ORDER BY product_count DESC
LIMIT 20;

SELECT
    ChemicalName,
    COUNT(DISTINCT CDPHId) AS product_count
FROM cscp_cleaned
GROUP BY ChemicalName
ORDER BY product_count DESC
LIMIT 20;

SELECT
    PrimaryCategory,
    COUNT(DISTINCT CDPHId) AS total_products,
    COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END) AS titanium_products,
    ROUND(
        COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END) 
        / COUNT(DISTINCT CDPHId) * 100, 2
    ) AS titanium_penetration_pct
FROM cscp_cleaned
GROUP BY PrimaryCategory
ORDER BY titanium_penetration_pct DESC;

SELECT
    CompanyName,
    COUNT(DISTINCT CDPHId) AS total_products,
    COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END) AS titanium_products,
    ROUND(
        COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END) 
        / COUNT(DISTINCT CDPHId) * 100, 2
    ) AS titanium_penetration_pct
FROM cscp_cleaned
GROUP BY CompanyName
HAVING COUNT(DISTINCT CDPHId) >= 50
ORDER BY titanium_products DESC
LIMIT 20;

SELECT
    ChemicalName,
    COUNT(*) AS total_listings,
    COUNT(DISTINCT CDPHId) AS products_affected,
    ROUND(COUNT(*) / COUNT(DISTINCT CDPHId), 2) AS avg_listings_per_product
FROM cscp_cleaned
GROUP BY ChemicalName
HAVING COUNT(DISTINCT CDPHId) >= 100
ORDER BY avg_listings_per_product DESC
LIMIT 20;

SELECT
    CDPHId,
    ProductName,
    CompanyName,
    PrimaryCategory,
    COUNT(DISTINCT ChemicalName) AS unique_chemicals,
    COUNT(*) AS total_listings
FROM cscp_cleaned
GROUP BY CDPHId, ProductName, CompanyName, PrimaryCategory
ORDER BY total_listings DESC
LIMIT 20;

SELECT COUNT(DISTINCT CDPHId) AS total_products
FROM cscp_cleaned;

SELECT COUNT(DISTINCT ChemicalName) AS total_chemicals
FROM cscp_cleaned;

SELECT
    COUNT(DISTINCT CDPHId) AS titanium_products
FROM cscp_cleaned
WHERE ChemicalName = 'Titanium dioxide';

SELECT
    ROUND(
        COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END)
        / COUNT(DISTINCT CDPHId) * 100, 2
    ) AS titanium_market_penetration_pct
FROM cscp_cleaned;

SELECT COUNT(DISTINCT CompanyName) AS total_companies
FROM cscp_cleaned;

SELECT
    PrimaryCategory,
    COUNT(DISTINCT CDPHId) AS total_products,
    COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END) AS titanium_products,
    ROUND(
        COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END)
        / COUNT(DISTINCT CDPHId) * 100, 2
    ) AS titanium_penetration_pct
FROM cscp_cleaned
GROUP BY PrimaryCategory
ORDER BY total_products DESC;

SELECT
    CompanyName,
    COUNT(DISTINCT CDPHId) AS total_products,
    COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END) AS titanium_products,
    ROUND(
        COUNT(DISTINCT CASE WHEN ChemicalName = 'Titanium dioxide' THEN CDPHId END)
        / COUNT(DISTINCT CDPHId) * 100, 2
    ) AS titanium_penetration_pct
FROM cscp_cleaned
GROUP BY CompanyName
HAVING COUNT(DISTINCT CDPHId) >= 50
ORDER BY titanium_products DESC;

SELECT
    ChemicalName,
    COUNT(DISTINCT CDPHId) AS products_affected,
    ROUND(
        COUNT(DISTINCT CDPHId) / (SELECT COUNT(DISTINCT CDPHId) FROM cscp_cleaned) * 100, 2
    ) AS market_penetration_pct
FROM cscp_cleaned
GROUP BY ChemicalName
ORDER BY products_affected DESC;cscp_cleaned

SELECT USER();
