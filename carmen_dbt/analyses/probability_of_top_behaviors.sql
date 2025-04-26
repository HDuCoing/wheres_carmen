-- For each month, what is the probability Ms. Sandiego exhibits one of her three most occurring behaviors?
-- count the sightings of each behavior in total
with total_sightings_by_month as (
    select
        date_trunc('month', date_witness) as month,
        count(*) as total_sightings
    from {{ ref('fct_sightings') }}
    group by 1
),
-- rank behaviors by count for each month
behavior_ranked_by_month as (
    select 
        date_trunc('month', date_witness) as month,
        count(*) as top_sightings_count
    from {{ ref('fct_sightings') }} f
    where f.behavior in (
        select behavior
        from {{ ref('most_common_behaviors') }}
        group by 1
    )
    group by date_trunc('month', date_witness)
)
-- probability of behavior for each month
select 
    t.month,
    -- get top sightings count, if null, replace with 0
    coalesce(b.top_sightings_count, 0) as top_sightings_count,
    t.total_sightings,
    --top sightings, if null, replace with 0, times 1.0 to get decimal and divide by total sightings for probability
    coalesce(b.top_sightings_count, 0) * 1.0 / t.total_sightings as probability
-- join on month
from total_sightings_by_month t
left join behavior_ranked_by_month b
  on t.month = b.month
order by t.month