SELECT
    row_number() over (order by latitude, longitude, city, country_code) as location_id,
    latitude,
    longitude,
    city,
    country_code
FROM {{ ref('int_sightings_all') }}
