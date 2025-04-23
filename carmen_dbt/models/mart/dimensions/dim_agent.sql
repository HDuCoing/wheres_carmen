select
    row_number() over (order by agent) as agent_id,
    agent_id,
    agent_name
from {{ ref('int_sightings_all') }}
