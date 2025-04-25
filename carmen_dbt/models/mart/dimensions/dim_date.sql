SELECT distinct
    {{ dbt_utils.generate_surrogate_key(['date_witness']) }} as date_witness_id,
    date_witness,
    date_agent
FROM {{ ref('int_sightings_all') }}
