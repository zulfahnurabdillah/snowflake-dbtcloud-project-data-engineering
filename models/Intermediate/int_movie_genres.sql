-- 1. Ambil data dari model stg_movies 
with stg_movies as (
    select * from {{ref("stg_movies")}}
)

select 
    movie_id,
    -- 2. "f.value" adalah nama kolom default dari fungsi split_to_table
    --    Kita ganti namanya menjadi 'genre'
    f.value as genre
from 
    stg_movies,
-- 3.  Ambil kolom 'genres' (misal: "Action|Adventure")
    -- Pisahkan (split) berdasarkan karakter pipa '|'
    -- 'lateral' berarti "lakukan ini untuk setiap baris"
    lateral split_to_table(stg_movies.genres, '|') f