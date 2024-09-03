-- performing normalization to genres column 
create view movies_updated as
select
    m.budget,
    g.genre_id,
    m.id,
    m.original_language,
    m.original_title,
    m.popularity,
    m.release_date,
    m.revenue,
    m.runtime,
    m.status,
    m.title,
    m.vote_average,
    m.vote_count
from
    movies m,
    json_table(
        m.genres,
        '$[*]' columns (
            genre_id int path '$'
        )
    ) AS g;