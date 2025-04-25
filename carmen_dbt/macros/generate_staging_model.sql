{% macro generate_staging_model(seed_name, region) %}
select distinct
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
    behavior,
    '{{ region }}' as region,
from {{ source('sightings_sources', seed_name) }}
{% endmacro %}