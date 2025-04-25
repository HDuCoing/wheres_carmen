select
  a.agent_id,
  w.witness_id,
  b.behavior_id,
  d.date_witness_id,
  l.location_id,
  i.region,
  i.date_witness,
  i.date_agent,
  i.witness,
  i.agent,
  i.latitude,
  i.longitude,
  i.city,
  i.country_code,
  i.city_agent,
  i.has_weapon,
  i.has_hat,
  i.has_jacket,
  i.behavior

from {{ ref('int_sightings_all') }} i

left join (
  select distinct agent, agent_id
  from {{ ref('dim_agent') }}
) a
  on i.agent = a.agent

left join (
  select distinct witness, witness_id
  from {{ ref('dim_witness') }}
) w
  on i.witness = w.witness

left join (
  select distinct behavior, behavior_id
  from {{ ref('dim_behavior') }}
) b
  on i.behavior = b.behavior

left join (
  select distinct date_witness, date_witness_id
  from {{ ref('dim_date') }}
) d
  on i.date_witness = d.date_witness

left join (
  select distinct latitude, longitude, location_id
  from {{ ref('dim_location') }}
) l
  on i.latitude = l.latitude
  and i.longitude = l.longitude