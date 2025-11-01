{{
    config(
        materialized = 'table',
        schema = 'ANALYTICS'
    )
}}

with genres as (
    select * from {{ref("int_movie_genres")}}
)

select distinct
    genre
from genres
where genre is not null 
and genre != '(no genres listed)' -- Membersihkan data yang tidak relevan
order by genre