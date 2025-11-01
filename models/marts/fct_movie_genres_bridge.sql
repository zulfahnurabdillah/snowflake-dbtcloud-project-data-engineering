{{
  config(
    materialized='table',
    schema='ANALYTICS'
  )
}}

select 
    movie_id,
    genre
from {{ ref('int_movie_genres') }}
where 
    genre is not null
    and genre != '(no genres listed)'