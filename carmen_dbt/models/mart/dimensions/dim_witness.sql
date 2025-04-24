select 
    {{ dbt_utils.surrogate_key(['witness']) }} as witness_id,
    witness
from {{ ref('int_sightings_all') }}
