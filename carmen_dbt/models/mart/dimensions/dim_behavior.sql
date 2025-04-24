select
    {{ dbt_utils.surrogate_key(['behavior']) }} as behavior_id,
    behavior
from {{ ref('int_sightings_all') }}
