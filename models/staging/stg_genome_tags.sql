with source as (
    select * from {{source("NETFLIX_PROJECT", 'GENOME_TAGS')}}
)

select 
    tagid as tag_id,
    tag

from source