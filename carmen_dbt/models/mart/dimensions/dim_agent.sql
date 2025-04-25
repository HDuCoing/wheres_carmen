select distinct
    {{ dbt_utils.generate_surrogate_key(['agent']) }} as agent_id,
    agent
from {{ ref('int_sightings_all') }}
