select
        custID as customer_id,
        Country,
        Date_of_business as date_of_business,
        Balance,
        Salary
from
{{ ref("silver_churn") }}