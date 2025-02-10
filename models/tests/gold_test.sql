{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('gold_churn_daily', 'balance equates to the right status') %}
  
  {% call dbt_unit_testing.mock_ref ('silver_churn') %}
    select 1 as customer_id, 50001 as balance
  {% endcall %}
  
  

  {% call dbt_unit_testing.expect() %}
    select 1 as customer_id, 'Not bad' as Status
  {% endcall %}
{% endcall %}