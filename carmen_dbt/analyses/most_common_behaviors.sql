-- What are the three most occurring behaviors of Ms. Sandiego?
-- count the sightings of each behavior in total
with behavior_counts as (
    select
        behavior,
        date_witness,
        count(*) as sightings_count
    from {{ ref('fct_sightings') }}
    group by behavior, date_witness
),
-- rank the behaviors based on counts
ranked_behavior as (
    select
        behavior,
        date_witness,
        sightings_count,
        row_number() over (
            order by sightings_count desc
        ) as rank
    from behavior_counts
)
-- top 3 behaviors only
select
    behavior,
    date_witness,
    sightings_count
from ranked_behavior
where rank <= 3
order by rank