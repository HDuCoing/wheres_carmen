SELECT
    {{ dbt_utils.surrogate_key(['latitude', 'longitude']) }} as location_id,
    latitude,
    longitude,
    city,
    country_code
FROM {{ ref('int_sightings_all') }}
