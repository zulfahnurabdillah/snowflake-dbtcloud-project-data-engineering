{{
  config(
    materialized='table',
    schema='ANALYTICS'
  )
}}

select 
    user_id,
    movie_id,
    rating,
    rated_at_timestamp::DATE as rating_date,
    rated_at_timestamp::TIME as rating_time,
    EXTRACT(HOUR FROM rated_at_timestamp) as rating_hour

from {{ ref('stg_ratings') }}