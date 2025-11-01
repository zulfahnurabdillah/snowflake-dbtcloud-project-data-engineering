{{
  config(
    materialized='table',
    schema='ANALYTICS'
  )
}}

select 
    user_id,
    movie_id,
    tag,
    tagged_at_timestamp::DATE as tag_date,
    tagged_at_timestamp::TIME as tag_time,
    EXTRACT(HOUR FROM tagged_at_timestamp) as tag_hour
from {{ ref('stg_tags') }}