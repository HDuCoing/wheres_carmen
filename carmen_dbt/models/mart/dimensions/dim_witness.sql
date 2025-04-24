select 
    row_number() over (order by witness) as witness_id,
    witness
from {{ ref('int_sightings_all') }}
