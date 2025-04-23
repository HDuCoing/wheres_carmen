select
    row_number() over (order by behavior) as behavior_id,
    behavior
from {{ ref('int_sightings_all') }}
