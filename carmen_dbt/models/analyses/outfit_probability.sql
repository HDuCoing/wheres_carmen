
-- extracts the month and the total of all sightings for each month
with monthly_sightings as (
    select
        has_weapon,
        has_hat,
        has_jacket,
        date_trunc('month', date_witness) as month,
        count(*) as total_sightings
    from {{ ref('fct_sightings') }}
    group by has_weapon, has_hat, has_jacket, date_trunc('month', date_witness)
),
-- extracts the month and the total of sightings with a weapon and jacket but no hat for each month
filtered_sightings as (
    select
        month,
        count(*) as count_sightings
    from monthly_sightings
    where has_weapon = true 
    and has_jacket = true 
    and has_hat = false
    group by month
)
-- calculates the probability of sightings for a given month where carmen is with a weapon and jacket but no hat
select
    m.month,
    -- if null, replace with 0
    coalesce(f.count_sightings, 0) as count_sightings,
    m.total_sightings,
    -- if null, replace with 0
    coalesce(f.count_sightings, 0) * 1.0 / m.total_sightings as probability
from monthly_sightings m
left join filtered_sightings f
  on m.month = f.month