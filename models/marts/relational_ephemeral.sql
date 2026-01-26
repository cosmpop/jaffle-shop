{{
    config(
            materialized = 'ephemeral'
    )
}}

/* view to be able to use pivot macro for salesforce_account_forecast_pivot_d */
SELECT
    *
FROM {{ ref('orders') }}
WHERE is_food_order = TRUE and is_drink_order = TRUE