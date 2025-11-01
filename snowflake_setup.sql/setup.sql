--create a WAREHOUSE
create warehouse netflix_wh
warehouse_size = 'MEDIUM'
auto_suspend = 60
auto_resume = true;

use warehouse netflix_wh;
--CREATE DATABASE and SCHEMA
create database netflix_dataset;
create schema netflix_dataset.raw;

use database netflix_dataset;
use schema raw;

--Buat Format File (Penerjemah CSV)
create file format my_csv_format
    type = 'CSV'            --tipe file
    field_delimiter = ','   --pemisah antar kolom
    skip_header = 1          --lewati baris pertama/header
    empty_field_as_null = true  --null value 
    field_optionally_enclosed_by = '"';

-- 1. Tabel untuk movie.csv
CREATE OR REPLACE TABLE MOVIES (
    movieId INT,
    title VARCHAR,
    genres VARCHAR
);

-- 2. Tabel untuk ratings.csv
-- (userId,movieId,rating,timestamp)
CREATE OR REPLACE TABLE RATINGS (
    userId INT,
    movieId INT,
    rating FLOAT, -- Gunakan FLOAT untuk desimal
    timestamp INT
);

-- 3. Tabel untuk tags.csv
-- (userId,movieId,tag,timestamp)
CREATE OR REPLACE TABLE TAGS (
    userId INT,
    movieId INT,
    tag VARCHAR,
    timestamp INT
);
-- 4. Tabel untuk links.csv
-- (movieId,imdbId,tmdbId)
CREATE OR REPLACE TABLE LINKS (
    movieId INT,
    imdbId VARCHAR, -- ID IMDB bisa mengandung 'tt' jadi harus VARCHAR
    tmdbId VARCHAR   -- ID TMDB juga kita set sebagai VARCHAR
);

-- 5. Tabel untuk genome-tags.csv
-- (tagId,tag)
CREATE OR REPLACE TABLE GENOME_TAGS (
    tagId INT,
    tag VARCHAR
);

-- 6. Tabel untuk genome-scores.csv
-- (movieId,tagId,relevance)
CREATE OR REPLACE TABLE GENOME_SCORES (
    movieId INT,
    tagId INT,
    relevance FLOAT -- 'relevance' adalah skor (desimal)
);
    
-- 1. Salin data ke tabel MOVIES
COPY INTO MOVIES
  FROM @%MOVIES
  FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');

-- 2. Salin data ke tabel RATINGS (Mungkin butuh waktu)
COPY INTO RATINGS
  FROM @%RATINGS
  FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');

-- 3. Salin data ke tabel TAGS
COPY INTO TAGS
  FROM @%TAGS
  FILE_FORMAT = (FORMAT_NAME = 'my_csv_format')
  ON_ERROR = 'CONTINUE'; 

-- 4. Salin data ke tabel LINKS
COPY INTO LINKS
  FROM @%LINKS
  FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');

-- 5. Salin data ke tabel GENOME_TAGS
COPY INTO GENOME_TAGS
  FROM @%GENOME_TAGS
  FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');

-- 6. Salin data ke tabel GENOME_SCORES
COPY INTO GENOME_SCORES
  FROM @%GENOME_SCORES
  FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');

  -- Cek 10 baris pertama dari tabel ratings
SELECT * FROM RATINGS LIMIT 10;

-- Hitung total baris di tabel ratings (seharusnya sekitar 20 juta)
SELECT COUNT(*) FROM RATINGS;

-- Cek 10 baris pertama dari tabel movies
SELECT * FROM MOVIES LIMIT 10;
