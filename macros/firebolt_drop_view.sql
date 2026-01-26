{% macro firebolt_drop_view_if_exists(schema_name, view_name) %}
  {% if execute %}
    {% set rel = adapter.get_relation(database=this.database, schema=schema_name, identifier=view_name) %}
    {% if rel is not none %}
      {# This updates dbt cache properly #}
      {% do adapter.drop_relation(rel) %}
    {% endif %}
  {% endif %}
{% endmacro %}