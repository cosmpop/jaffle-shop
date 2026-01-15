{# Firebolt pgwire compatibility when using dbt-postgres adapter #}

{% macro postgres__type_timestamp() %}
  timestamp
{% endmacro %}

{# Optional safety net: if dispatch falls back to default #}
{% macro default__type_timestamp() %}
  timestamp
{% endmacro %}