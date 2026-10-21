-- Kliendigruppide analüüs CTE-ga

-- Leian iga kleindi kogukäibe ja segmenteerin nad selle põhjal gruppidesse "VIP" (kogukäive vähemalt 10000€), "Regular" (kogukäive vähemalt 500€) ja "Uus" (kogukäive alla 500€). 

WITH kliendi_kokkuvote AS (
  SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nimi,
    c.city,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(s.total_price) AS kogukäive
  FROM customers c
  JOIN sales s ON c.customer_id = s.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name, c.city
)
SELECT
  nimi,
  city,
  tellimuste_arv,
  kogukäive,
  CASE
    WHEN kogukäive >= 10000 THEN 'VIP'
    WHEN kogukäive >= 500 THEN 'Regular'
    ELSE 'Uus'
  END AS segment
FROM kliendi_kokkuvote
ORDER BY kogukäive DESC;

-- Kokku on 2551 klienti, kes on teinud vähemalt ühe ostu ja saanud vastavalt käibele staatuse. 

-- Leian mitu klienti on igas segmendis (VIP, Regular, Uus)

WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        COALESCE(SUM(s.total_price), 0) AS kogukäive
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id
)
SELECT
    CASE
        WHEN kogukäive >= 10000 THEN 'VIP'
        WHEN kogukäive >= 500 THEN 'Regular'
        ELSE 'Uus'
    END AS segment,
    COUNT(*) AS klientide_arv
FROM kliendi_kokkuvote
GROUP BY segment
ORDER BY klientide_arv;

-- Segmendis VIP on 15, Regular 1707, Uus 1428 klienti (sh ostudeta kliendid).


-- Leian TOP10 klienti kasutades:
--  - GROUP BY kliendi järgi;    - SUM(total_price) kogukäibe leidmiseks;    - HAVING: vähemalt 2 tellimust (filteeri välja ühekordse ostuga kliendid);   - ORDER BY kogukäive DESC, LIMIT 10

WITH TOP_kliendid AS (
  SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nimi,
    c.city AS linn,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(total_price) AS kogukäive
  FROM customers c
  JOIN sales s ON c.customer_id = s.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name, c.city
  HAVING COUNT(s.sale_id) >= 2
)
SELECT
  nimi,
  linn,
  tellimuste_arv,
  kogukäive
FROM TOP_kliendid
ORDER BY kogukäive DESC
LIMIT 10;

-- TOP1 käibe poolest on Tiina Pärn Tartust, kes on teinud 73 tellimust kogumaksumusega 27668€. 10.kohal on Ago Kull Pärnust 64 ostuga kogusummas 20125€. TOP10-s on veel kliente Tallinnast ja Viljandist. Ostude arv on vahemikus 64-78.


-- Leian iga segmendi keskmise käibe ja kogukäibe

WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        COALESCE(SUM(s.total_price), 0) AS kogukäive              -- käibe arvutamisel saavad ostudeta kliendid käibe väärtuseks 0€
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id            -- võtame arvesse ka kliendid, kes pole teinud ühtegi ostu
    GROUP BY c.customer_id
)
SELECT
    CASE
        WHEN kogukäive >= 10000 THEN 'VIP'
        WHEN kogukäive >= 500 THEN 'Regular'
        ELSE 'Uus'
    END AS segment,
    COUNT(*) AS klientide_arv,
    ROUND(AVG(kogukäive), 2) AS keskmine_käive,
    ROUND(SUM(kogukäive), 2) AS segmendi_kogukäive
FROM kliendi_kokkuvote
GROUP BY segment
ORDER BY keskmine_käive DESC;

-- VIP klientide keskmine käive 21266€, Regular klientidel 1224€ ja Uus klientidel 150€. Regular klientide kogukäive 2.1mln€, Uus klientidel 214th€ ja VIP klientidel 319th€


-- Millistes linnades on kõige rohkem VIP kliente?

WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.city AS linn,
        COALESCE(SUM(s.total_price), 0) AS kogukäive
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.city
)
SELECT
    linn,
    COUNT(*) AS vip_klientide_arv
FROM kliendi_kokkuvote
WHERE kogukäive >= 10000
GROUP BY linn
ORDER BY vip_klientide_arv DESC;

-- VIP kliendid on linnadest Pärnu, Tallinn, Tartu, Rakvere, Jõhvi ja Viljandi. Enim Pärnust ja Tallinnast - mõlemast 5.

-- Millistes linnades on kõige rohkem Regular kliente?

WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.city AS linn,
        COALESCE(SUM(s.total_price), 0) AS kogukäive
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.city
)
SELECT
    linn,
    COUNT(*) AS regular_klientide_arv
FROM kliendi_kokkuvote
WHERE kogukäive < 10000 AND kogukäive >= 500
GROUP BY linn
ORDER BY regular_klientide_arv DESC;

-- Regular kliendid on 12 erinevast linnast. Enim Tallinnast, Tartust ja Pärnust.


-- Millistes linnades on kõige rohkem Uus kliente?

WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.city AS linn,
        COALESCE(SUM(s.total_price), 0) AS kogukäive
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.city
)
SELECT
    linn,
    COUNT(*) AS uus_klientide_arv
FROM kliendi_kokkuvote
WHERE kogukäive < 500
GROUP BY linn
ORDER BY uus_klientide_arv DESC;

-- Uus kliendid on 12 erinevast linnast. Enim Tallinnast, Tartust ja Pärnust.


-- Lisan window funktsiooni klientide järjestamiseks
-- Järjestan kliendid linnade kaupa kogukäibe järgi
WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS klient,
        c.city,
        COALESCE(SUM(s.total_price), 0) AS kogukäive
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city
)
SELECT
    klient,
    city AS linn,
    kogukäive,
    RANK() OVER (
        PARTITION BY city
        ORDER BY kogukäive DESC
    ) AS koht_linnas
FROM kliendi_kokkuvote
ORDER BY city, koht_linnas;

-- Saadud tabelis on 3150 rida ehk kõik kliendid. Järjestus kogukäibe aluses linnade kaupa.
