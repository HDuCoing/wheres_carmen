select
    {{ dbt_utils.surrogate_key(['agent']) }} as agent_id,
    agent
from {{ ref('int_sightings_all') }}
