ALTER TABLE "User" ADD COLUMN is_human boolean ;

UPDATE "User" SET is_human = true WHERE first_name != 'Danny';

DELETE FROM "User" WHERE is_human;

DROP TABLE "Contact";
