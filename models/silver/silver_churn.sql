WITH staged_data AS (
    SELECT 
        customerid AS custID,
        surname AS Surname,
        geography AS Country,
        gender AS Gender,
        balance as Balance,
        estimatedsalary as Salary,
        date(date_format(buss_dt,'yyyy-MM-dd')) as Date_of_business
    FROM {{ ref('bronze_churn') }}
)

select * from staged_data