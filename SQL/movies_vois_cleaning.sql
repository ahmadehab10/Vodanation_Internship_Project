-- only selecting ids in json array columns

UPDATE movies
SET genres = (
    SELECT JSON_ARRAYAGG(JSON_EXTRACT(value, '$.id'))
    FROM JSON_TABLE(movies.genres, '$[*]' COLUMNS(value JSON PATH '$')) AS jt
)
WHERE genres IS NOT NULL;


UPDATE movies
SET keywords = (
    SELECT JSON_ARRAYAGG(JSON_EXTRACT(value, '$.id'))
    FROM JSON_TABLE(movies.keywords, '$[*]' COLUMNS(value JSON PATH '$')) AS jt
)
WHERE keywords IS NOT NULL;

UPDATE movies
SET production_companies = (
    SELECT JSON_ARRAYAGG(JSON_EXTRACT(value, '$.id'))
    FROM JSON_TABLE(movies.production_companies, '$[*]' COLUMNS(value JSON PATH '$')) AS jt
)
WHERE production_companies IS NOT NULL;

UPDATE movies
SET production_countries = (
    SELECT JSON_ARRAYAGG(JSON_EXTRACT(value, '$.iso_3166_1'))
    FROM JSON_TABLE(movies.production_countries, '$[*]' COLUMNS(value JSON PATH '$')) AS jt
)
WHERE production_countries IS NOT NULL;
