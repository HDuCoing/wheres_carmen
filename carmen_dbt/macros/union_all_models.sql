-- Takes in a list of models and columns - returns a union of all models with the specified columns
{% macro union_models(models, columns) %}
  select distinct
    {% for column in columns %}
      {{ column }}{% if not loop.last %}, {% endif %}
    {% endfor %}
  from (
    {% for model in models %}
      (
        select
          {% for column in columns %}
            {{ column }}{% if not loop.last %}, {% endif %}
          {% endfor %}
        from {{ ref(model) }}
      )
      {% if not loop.last %}union all{% endif %}
    {% endfor %}
  ) as combined
{% endmacro %}