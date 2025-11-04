-- 'config block', bagian penting dari model mart
{{
  config(
    materialized='table',
    schema='ANALYTICS'
  )
}}

with stg_movies as(
    select * from {{ref("stg_movies")}}
),

stg_links as (
    select * from {{ ref('stg_links') }}
)

select
    m.movie_id,
    m.title,
    m.release_year,
    l.imdb_id,  
    l.tmdb_id   

from stg_movies as m

left join stg_links as l

    on m.movie_id = l.movie_id
