select
    row_number() over (order by agent) as agent_id,
    agent
from {{ ref('int_sightings_all') }}
