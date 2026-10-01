--Mitu toodet on kokku?
SELECT COUNT(*) AS toodete_arv FROM products;

-- Millised veerud ja andmed tabelis on?
SELECT * FROM products LIMIT 10;

--Puuduvad andmed
SELECT * FROM products
WHERE product_id IS NULL
   OR product_name IS NULL
   OR category IS NULL
   OR subcategory IS NULL
   OR supplier IS NULL
   OR cost_price IS NULL
   OR retail_price IS NULL
   OR eco_certified IS NULL
   OR created_at IS NULL;

--Mitu rida on NULL veerus eco_certified?
SELECT COUNT(*)
FROM products
WHERE eco_certified IS NULL;



