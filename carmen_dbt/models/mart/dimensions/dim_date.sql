SELECT
    row_number() over (order by dt) as date_id,
    date_witness,
    date_agent
FROM {{ ref('int_sightings_all') }}
