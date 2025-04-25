select
    {{ dbt_utils.generate_surrogate_key(['behavior']) }} as behavior_id,
    behavior
from {{ ref('int_sightings_all') }}
