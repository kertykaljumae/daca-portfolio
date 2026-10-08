
-- Kontrollin, kas kõik müügis viidatud kliendid eksisteerivad:
-- Orbid kliendid — kas on customer_id, mida pole customers tabelis?
SELECT COUNT(*) AS orb_klient
FROM sales
WHERE customer_id IS NOT NULL
  AND customer_id NOT IN (SELECT customer_id FROM customers WHERE customer_id IS NOT NULL);
-- 0 müüki viitab olematule kliendile

-- Kontrollin, kas kõik müügis viidatud tooted eksisteerivad:
-- Orbid müügid — kas on product_id, mida pole products tabelis?
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
