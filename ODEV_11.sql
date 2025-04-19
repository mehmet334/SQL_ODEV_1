'actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.'

SELECT DISTINCT first_name FROM actor
UNION
SELECT DISTINCT first_name FROM customer
ORDER BY first_name;

'Tekrarlı veriler'
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer
ORDER BY first_name;

'actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.'

SELECT DISTINCT first_name FROM actor
INTERSECT
SELECT DISTINCT first_name FROM customer
ORDER BY first_name;
'Tekrarlı veriler'
SELECT a.first_name
FROM actor a
JOIN customer c ON a.first_name = c.first_name
ORDER BY a.first_name;


'actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.'

SELECT DISTINCT first_name FROM actor
EXCEPT
SELECT DISTINCT first_name FROM customer
ORDER BY first_name;
'Tekrarlı veriler'
SELECT a.first_name
FROM actor a
WHERE NOT EXISTS (
    SELECT 1 FROM customer c WHERE c.first_name = a.first_name
)
ORDER BY a.first_name;

