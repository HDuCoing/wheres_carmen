/*
This models purpose is to transform all the stage models into a single table that can be funnelled into the mart layer.
*/

with africa as ( 
    select *, 'africa' AS region FROM {{ ref("stg_sightings_africa")}}
),

america as ( 
    select *, 'america' AS region FROM {{ ref("stg_sightings_america")}}
),

asia as ( 
    select *, 'asia' AS region FROM {{ ref("stg_sightings_asia")}}
),

atlantic as ( 
    select *, 'atlantic' AS region FROM {{ ref("stg_sightings_atlantic")}}
),

australia as ( 
    select *, 'australia' AS region FROM {{ ref("stg_sightings_australia")}}
),

europe as ( 
    select *, 'europe' AS region FROM {{ ref("stg_sightings_europe")}}
),

indian as ( 
    select *, 'indian' AS region FROM {{ ref("stg_sightings_indian")}}
),

pacific as ( 
    select *, 'pacific' AS region FROM {{ ref("stg_sightings_pacific")}}
)


SELECT * FROM africa
UNION
SELECT * FROM america
UNION
SELECT * FROM asia
UNION
SELECT * FROM atlantic
UNION
SELECT * FROM australia
UNION
SELECT * FROM europe
UNION
SELECT * FROM indian
UNION
SELECT * FROM pacific