with source as (
    select * from {{source("NETFLIX_PROJECT", 'GENOME_SCORES')}}
)

select 
    movieId as movie_id,
    tagid as tag_id,
    round(relevance,4) as relevance_score

from source 