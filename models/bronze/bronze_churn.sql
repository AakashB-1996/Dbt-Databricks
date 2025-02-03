{{
    config(
        materialized='incremental',
        unique_key = 'customerid'
    )
}}

SELECT 
*
FROM {{source("wrk_training","churn_modelling")}} 


{% if is_incremental() %}

where buss_dt > (select coalesce(max(buss_dt),'1900-01-01') from {{ this }})

{% endif %}