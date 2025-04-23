select
  a.agent_id,
  w.witness_id,
  b.behavior_id,
  d.date_id as witness_date_id,
  d2.date_id as agent_date_id,
  l.location_id,
  i.has_weapon,
  i.has_hat,
  i.has_jacket

from {{ ref('int_sightings_all') }} i

left join {{ ref('dim_agent') }} a
  on i.agent = a.agent

left join {{ ref('dim_witness') }} w
  on i.witness = w.witness

left join {{ ref('dim_behavior') }} b
  on i.behavior = b.behavior

left join {{ ref('dim_date') }} d
  on i.date_witness = d.date

left join {{ ref('dim_date') }} d2
  on i.date_agent = d2.date

left join {{ ref('dim_location') }} l
  on i.latitude = l.latitude
  and i.longitude = l.longitude
  and i.city = l.city
  and i.country_code = l.country_code
