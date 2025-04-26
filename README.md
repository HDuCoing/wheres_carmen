# wheres_carmen?!?!?!? 

## Process
1. This project takes in raw data as seeds and creates them into source tables as the starting step.

2. There is a default schema set in Profiles.yml, but each folders has a override schema within the dbt_project. While this isn't always ideal or well-liked that's just what I ended up doing for this.
```yaml
models:
  carmen_dbt:
    staging:
      +schema: staging
      +materialized: view

    mart:
      +schema: mart
      dimensions:
        +materialized: table
      facts:
        +materialized: table

    intermediate:
      +schema: intermediate
      +materialized: view
      
    analysis:
      +schema: analysis
      +materialized: table

seeds:
  +schema: sources
  ```
The staging area will use the source tables as building blocks to put neatly into a relational format in Snowflake.

3. In the interemediate stage there is a table that joins all rows and drops duplicates that aren't needed. This is to avoid 100 trillion rows appearing.

4. The mart stage has dimension and fact tables where different key components of data can easily be separated out. In addition to this, I ensured each column category has a surrogate key to uniquely identify it. This way every row is unique. Like a snowflake!

5. The analysis stage has 3 sections. Adhoc analyses scripts, analysis models for this project, and exposures. These aggregate the data to find informative analytics!

The DAG ends up looking like this:
![DAG](images/modelDAG.png "DAG of DBT Structure")
