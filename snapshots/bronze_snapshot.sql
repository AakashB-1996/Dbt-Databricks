{% snapshot bronze_snapshot %}
    {{
        config(
            target_database='ic4_catalog',
            target_schema='wrk_training',
            unique_key='country',
            strategy='timestamp',
            updated_at='edh_rec_cre_ts',
            dbt_valid_to_current="date('9999-12-31')"
        )
    }}
    
    select
        *,
        cast('{{ var("dbt_snapshot_time", "9999-12-31 23:59:59") }}' as timestamp) as dbt_snapshot_time
    from {{ source('wrk_training', 'world_population') }}
{% endsnapshot %}