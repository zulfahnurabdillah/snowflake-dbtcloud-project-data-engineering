with source as (

    -- Memilih data dari sumber 'raw' (sources.yml), tabel 'MOVIES'
    select * from {{ source('NETFLIX_PROJECT', 'MOVIES') }}

)

select
    -- 1. Ganti nama kolom dari 'movieId' menjadi 'movie_id' (snake_case)
    movieId as movie_id,
    
    -- 2. Pisahkan judul dan tahun rilis
    -- Contoh: "Toy Story (1995)" akan dipecah
    
    -- Menjadi -> "Toy Story"
    trim(regexp_replace(title, '\\(\\d{4}\\)$', '')) as title,
    
    -- Menjadi -> "1995"
    regexp_substr(title, '(\\d{4})', 1, 1, 'e') as release_year,
    
    -- 3. Biarkan kolom genres 
    genres

from source