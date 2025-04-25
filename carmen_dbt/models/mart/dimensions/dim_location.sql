SELECT
    {{ dbt_utils.generate_surrogate_key(['latitude', 'longitude']) }} as location_id,
    latitude,
    longitude,
    city,
    country_code
FROM {{ ref('int_sightings_all') }}
