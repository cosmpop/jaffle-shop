{{ config(materialized='table') }}

select *
from {{ ref('stg_type_coverage') }}