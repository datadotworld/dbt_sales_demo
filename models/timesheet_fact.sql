WITH timesheet_base AS (
    SELECT
        t.timesheetid,
        t.employeeid,
        t.date,
        t.hoursworked,
        e.firstname,
        e.lastname,
        d.departmentname,
        j.jobtitlename
    FROM
        {{ source('sales_demo', 'timesheet') }} t
    LEFT JOIN
        {{ source('sales_demo', 'employee') }} e ON t.employeeid = e.employeeid
    LEFT JOIN
        {{ source('sales_demo', 'department') }} d ON e.departmentid = d.departmentid
    LEFT JOIN
        {{ source('sales_demo', 'jobtitle') }} j ON e.jobtitleid = j.jobtitleid
)

SELECT
    timesheetid,
    employeeid,
    date,
    DAYNAME(date) AS day_of_week,
    hoursworked,
    firstname,
    lastname,
    departmentname,
    jobtitlename
FROM 
    timesheet_base