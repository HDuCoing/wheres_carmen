{% set models = [
    'stg_sightings_africa',
    'stg_sightings_america',
    'stg_sightings_asia',
    'stg_sightings_atlantic',
    'stg_sightings_australia',
    'stg_sightings_europe',
    'stg_sightings_indian',
    'stg_sightings_pacific'
] %}
with deduplicated_staging as (
    {% for model in models %}
    select distinct
        date_witness,
        date_agent,
        witness,
        agent,
        latitude,
        longitude,
        city,
        country_code,
        region,
        city_agent,
        has_weapon,
        has_hat,
        has_jacket,
        behavior
    from {{ ref(model) }}
    {% if not loop.last %}union{% endif %}
    {% endfor %}
)

select distinct
    date_witness,
    date_agent,
    witness,
    agent,
    latitude,
    longitude,
    city,
    region,
    country_code,
    city_agent,
    has_weapon,
    has_hat,
    has_jacket,
    behavior
from deduplicated_staging