{# Firebolt compat for dbt_date when running via dbt-postgres adapter #}

{% macro postgres__convert_timezone(timestamp_expr, source_tz, target_tz) %}
  {# Firebolt: AT TIME ZONE not supported; keep expression unchanged #}
  {{ return(timestamp_expr) }}
{% endmacro %}

{% macro postgres__from_unixtimestamp(epochs, format="seconds") %}
  {%- if format != "seconds" -%}
    {{ exceptions.raise_compiler_error(
      "value " ~ format ~ " for `format` for from_unixtimestamp is not supported."
    ) }}
  {%- endif -%}

  {# Firebolt: avoid `at time zone 'UTC'` #}
  cast(to_timestamp({{ epochs }}) as {{ dbt.type_timestamp() }})
{% endmacro %}