with source as (
    select * from {{source("NETFLIX_PROJECT", 'TAGS')}}
)
-- Ganti nama kolom ke snake_case
select 
    userId as user_id,
    movieId as movie_id,

--biarkan kolom tag
    TAG,

-- Ubah 'timestamp' (angka) menjadi 'timestamp' (waktu)
to_timestamp(timestamp) as tagged_at_timestamp

from source

