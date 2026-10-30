-- Operatiivsed näitajad

-- Müük kaupluste lõikes
SELECT 
    store_location, 
    SUM(total_price) AS tulu, 
    COUNT(*) AS tehinguid 
FROM sales 
GROUP BY store_location 
ORDER BY tulu DESC;
-- Kõige rohkem müüakse Tallinna kaupluses ja e-poes (NULL väärtused). Kõige vähem Pärnu kaupluses.

-- Laoseisude jaotus kategooria järgi
SELECT 
    p.category, 
    SUM(i.quantity_available) AS kogus 
FROM inventory i 
JOIN products p ON i.product_id = p.product_id 
GROUP BY p.category 
ORDER BY kogus DESC;
-- Laoseisud on kümnetes ja sadades tuhandetes, kuigi kokku on aastate jooksul müüdud 18tuh ühikut erinevaid tooteid. Vajalik inventuur.

-- Müüdud kogus kokku
SELECT
    sum(quantity) AS müüdud_tooteid
FROM sales;
-- Kokku on müüdud läbi aegade 18379 toodet
