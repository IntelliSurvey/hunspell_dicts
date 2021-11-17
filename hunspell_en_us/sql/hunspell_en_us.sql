CREATE EXTENSION hunspell_en_us;

CREATE TABLE table1(name varchar);
INSERT INTO table1 VALUES ('leaves'), ('leaved'), ('leaving'), ('housewives'),
                        ('inability'), ('abilities'), ('disability'), ('ability'),
                        ('wives'), ('wife'), ('lives'), ('life'), ('knives'), ('knife');

SELECT d.* FROM table1 AS t, LATERAL ts_debug('english_hunspell', t.name) AS d;

CREATE INDEX name_idx ON table1 USING GIN (to_tsvector('english_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'leaving');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'abilities');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'ability');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'wives');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'lives');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'knives');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'housewives');

DROP INDEX name_idx;
CREATE INDEX name_idx ON table1 USING GIST (to_tsvector('english_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'leaving');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'abilities');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'ability');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'wives');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'lives');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'knives');
SELECT * FROM table1 WHERE to_tsvector('english_hunspell', name)
    @@ to_tsquery('english_hunspell', 'housewives');
