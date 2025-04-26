/* For each month, which agency region is Carmen Sandiego most likely to be found? */
-- extract month fomm date_witness as month, select the month and count the sightings - group them
with monthly_sightings as (
    select
        date_trunc('month', date_witness) as month,
        region,
        count(*) as sightings_count
    from {{ ref('fct_sightings') }}
    group by 1, 2
),
-- rank the sightings based on counts
ranked_sightings as (
    select
        month,
        region,
        sightings_count,
        row_number() over (partition by month order by sightings_count desc) as rank
    from monthly_sightings
)
-- select the top region for each month
select
    month,
    region,
    sightings_count
from ranked_sightings
where rank = 1