SELECT first_name, last_name FROM "User" where EXTRACT(CENTURY FROM date_of_birth) = 21 ORDER BY first_name DESC;

SELECT biography FROM "User" where biography LIKE '% man %';

SELECT "User".first_name, "User".last_name, "Contact".type, "Contact".value FROM "User" JOIN "Contact" on "User".id = "Contact".user_id WHERE "User".first_name = 'Danny';

SELECT "User".first_name FROM "User" JOIN "Contact" ON "Contact".user_id = "User".id GROUP BY "User".first_name HAVING count(*)>1;

SELECT "User".first_name, count(type) FROM "User", "Contact" WHERE "User".id = "Contact".user_id GROUP BY "User".first_name;
