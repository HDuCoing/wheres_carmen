select 
    row_number() over (order by witness) as witness_id,
    witness_name
from {{ ref('int_sightings_all') }}
