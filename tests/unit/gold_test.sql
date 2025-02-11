{{ config(tags=['unit-test']) }}
--depends_on: {{ ref('bronze_churn') }} not able to run
{% call dbt_unit_testing.test('silver_churn', 'balance equates to the right status') %}
  
  {% call dbt_unit_testing.mock_ref('bronze_churn') %}
    select 1 as custID,
        '' as Country,
        '' AS Surname,
        '' AS Gender,
        '' as Date_of_business,
        50001 as balance
  {% endcall %}
  
  

  {% call dbt_unit_testing.expect() %}
    select 1 as custID, 'Not bad' as Status
  {% endcall %}
{% endcall %}