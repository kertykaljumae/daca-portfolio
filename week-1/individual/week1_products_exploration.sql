--Mitu toodet on kokku?
SELECT COUNT(*) AS toodete_arv FROM products;

-- Millised veerud ja andmed tabelis on?
SELECT * FROM products LIMIT 10;

-- Kõik unikaalsed tootekategooriad
SELECT DISTINCT category FROM products;

-- 10 kalleimat toodet
SELECT product_name, category, retail_price
FROM products
ORDER BY retail_price DESC
LIMIT 10;

-- 10 kalleimat toodet (või 10+, kui viimast hinda on rohkem, kui 1)
SELECT product_name, category, retail_price
FROM products
ORDER BY retail_price DESC
FETCH FIRST 10 ROWS WITH TIES;

-- 10 odavamat toodet
SELECT product_name, category, retail_price
FROM products
ORDER BY retail_price ASC
LIMIT 10;

-- 10 odavamat toodet (või 10+, kui viimast hinda on rohkem, kui 1)
SELECT product_name, category, retail_price
FROM products
ORDER BY retail_price ASC
FETCH FIRST 10 ROWS WITH TIES;

-- Näide: kõik kindla kategooria tooted
SELECT * FROM products
WHERE category = 'naiste_riided'
ORDER BY retail_price DESC
LIMIT 10;

-- Puuduvad hinnad
SELECT COUNT(*) - COUNT(retail_price) AS puuduvad_hinnad
FROM products;

-- Puuduvad kategooriad
SELECT COUNT(*) - COUNT(category) AS puuduvad_kategooriad
FROM products;

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

--Missugustel toodetel on eco_certified määramata?
SELECT product_id, product_name, eco_certified
FROM products
WHERE eco_certified IS NULL;



