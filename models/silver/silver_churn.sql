WITH staged_data AS (
    SELECT 
        customerid AS custID,
        surname AS Surname,
        geography AS Country,
        gender AS Gender,
        balance as Balance,
        case
            when balance < 50000 then 'Stuggle'
            when balance >= 50000 and balance <= 100000 then 'Not bad'
            else 'Perfect' end as Status,
        estimatedsalary as Salary,
        date(date_format(buss_dt,'yyyy-MM-dd')) as Date_of_business
    FROM {{ ref('bronze_churn') }}
)

select * from staged_data