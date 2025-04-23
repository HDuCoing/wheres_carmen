
with raw_america as (
    select
        date_witness,
        date_agent,
        witness,
        agent,
        latitude,
        longitude,
        city,
        country_code,
        city_agent,
        has_weapon,
        has_hat,
        has_jacket,
        behavior
    from {{ source('sources','carmen_sightings__america') }}
)

select
    *
from raw_america
