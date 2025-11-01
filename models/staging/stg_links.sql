with source as (
    select * from {{source("NETFLIX_PROJECT", 'LINKS')}}
)

select 
    movieId as movie_id,
    imdbid as imdb_id,
    tmdbid as tmdb_id

from source