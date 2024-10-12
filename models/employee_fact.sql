WITH employee_base AS (
    SELECT
        e.employeeid,
        e.firstname,
        e.lastname,
        d.departmentname,
        j.jobtitlename
    FROM
        {{ source('sales_demo', 'employee') }} e
    LEFT JOIN
        {{ source('sales_demo', 'department') }} d ON e.departmentid = d.departmentid
    LEFT JOIN
        {{ source('sales_demo', 'jobtitle') }} j ON e.jobtitleid = j.jobtitleid
)

SELECT 
    employeeid,
    firstname,
    lastname,
    departmentname,
    jobtitlename
FROM 
    employee_base