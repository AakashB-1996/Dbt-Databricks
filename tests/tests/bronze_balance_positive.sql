{{
    config(
        severity = 'warn'
    )
}}

select
* 
from
{{source('wrk_training','churn_modelling')}}
where balance < 0