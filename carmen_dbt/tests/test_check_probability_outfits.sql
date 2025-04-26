-- Validates that a column is a valid probability (between 0 and 1 or 0% to 100%)
with validation as (
    select probability
    from {{ ref("outfit_probability") }}
    where probability < 0
       or probability > 1
       or probability is null
)
select *
from validation
