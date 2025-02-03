select * from (
        
    

    select *,
        md5(coalesce(cast(customerid as string ), '')
         || '|' || coalesce(cast(edh_rec_cre_ts as string ), '')
        ) as dbt_scd_id,
        edh_rec_cre_ts as dbt_updated_at,
        edh_rec_cre_ts as dbt_valid_from,
        
  
  coalesce(nullif(edh_rec_cre_ts, edh_rec_cre_ts), CAST('9999-12-31' AS DATE))
  as dbt_valid_to
from (
        select * from `ic4_catalog`.`wrk_training`.`churn_modelling`
    ) sbq



    ) as __dbt_sbq
    