
-- Kontrollin, kas kõik müügis viidatud kliendid eksisteerivad:
-- "Orb" kliendid — kas on customer_id, mida pole customers tabelis?
SELECT COUNT(*) AS orb_klient
FROM sales
WHERE customer_id IS NOT NULL
  AND customer_id NOT IN (SELECT customer_id FROM customers WHERE customer_id IS NOT NULL);
-- 0 müüki viitab olematule kliendile


-- Kontrollin, kas kõik müügis viidatud tooted eksisteerivad:
-- "Orb" müügid — kas on product_id, mida pole products tabelis?
SELECT COUNT(*) AS orb_toode
FROM sales
WHERE product_id IS NOT NULL
  AND product_id NOT IN (SELECT product_id FROM products WHERE product_id IS NOT NULL);
-- 0 müüki viitab olematule tootele


-- Kontrollin, kas on kliente, kes pole kunagi ostnud:
SELECT COUNT(*) AS vaimkliendid
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM sales WHERE customer_id IS NOT NULL);
-- 592 klienti pole kunagi ostnud


-- Kontrollin, kas on tooteid, mida pole kunagi müüdud:
SELECT COUNT(*) AS vaimtooted
FROM products
WHERE product_id NOT IN (SELECT product_id FROM sales WHERE product_id IS NOT NULL);
-- 12 toodet pole kunagi müüdud (kas need samad duplikaadid?)


-- Need müügita tooted, mille tootenmetus esineb toodete tabelis rohkem kui ühe korra
SELECT
    p.product_id,
    p.product_name,
    p.category
FROM products p
WHERE p.product_id NOT IN (
    SELECT s.product_id
    FROM sales s
    WHERE s.product_id IS NOT NULL
)
AND p.product_name IN (
    SELECT product_name
    FROM products
    GROUP BY product_name
    HAVING COUNT(*) > 1
)
ORDER BY p.product_name;


-- Kuva kõik sama nimetusega tooted kõrvuti järjestatuna, et võrrelda andmeid
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.supplier,
    p.cost_price,
    p.retail_price,
    p.eco_certified,
    p.created_at
FROM products p
WHERE p.product_name IN (
    SELECT product_name
    FROM products
    GROUP BY product_name
    HAVING COUNT(*) > 1
)
ORDER BY p.product_name, p.product_id;
