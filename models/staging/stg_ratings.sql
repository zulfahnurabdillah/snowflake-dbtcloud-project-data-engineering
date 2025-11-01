with source as (

    select * from {{ source('NETFLIX_PROJECT', 'RATINGS') }}

)

select
    -- Ganti nama kolom ke snake_case
    userId as user_id,
    movieId as movie_id,

    -- Biarkan kolom rating
    rating,

    -- Ubah 'timestamp' (angka) menjadi 'timestamp' (waktu)
    to_timestamp(timestamp) as rated_at_timestamp

from source