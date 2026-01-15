with source as (

    select * from {{ source('ecom', 'raw_type_coverage') }}

),

typed as (

    select
        cast(id as integer)                 as id,
        cast(int_col as integer)            as int_col,
        cast(numeric_col as numeric(10,2))  as numeric_col,
        cast(double_col as double)          as double_col,
        cast(real_col as real)              as real_col,
        cast(bool_col as boolean)           as bool_col,
        cast(text_col as text)              as text_col,
        cast(varchar_col as varchar)        as varchar_col,
        cast(date_col as date)              as date_col,
        cast(ts_col as timestamp)           as ts_col
    from source

)

select * from typed