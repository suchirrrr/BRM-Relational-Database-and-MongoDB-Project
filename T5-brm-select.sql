--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID:[student ID omitted]
--Student Name: Suchir Ganesh

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
--5(a)
SELECT
    c.cust_no,
    nvl(
        c.cust_bname,
        c.cust_gname
        || ' '
        || c.cust_fname
    ) AS customer_name,
    COUNT(q.quote_no) AS num_quotes,
    to_char(
        AVG(q.quote_cost),
        '$999,999.00'
    ) AS avg_quote_cost
FROM
         customer c
    JOIN quote q ON c.cust_no = q.cust_no
GROUP BY
    c.cust_no,
    nvl(
        c.cust_bname,
        c.cust_gname
        || ' '
        || c.cust_fname
    )
HAVING
    COUNT(q.quote_no) > 1
    AND AVG(q.quote_cost) > (
        SELECT
            AVG(quote_cost)
        FROM
            quote
    )
ORDER BY
    AVG(q.quote_cost) DESC,
    c.cust_no;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    e.emp_no,
    e.emp_gname
    || ' '
    || e.emp_fname AS emp_name,
    CASE e.emp_role
        WHEN 'B' THEN
            'Manager'
        WHEN 'T' THEN
            'Truck Dispatcher'
        WHEN 'M' THEN
            'Mechanic'
        WHEN 'D' THEN
            'Driver'
    END AS emp_role_full,
    CASE
        WHEN e.emp_no_manager IS NULL THEN
            'No Manager'
        ELSE
            m.emp_gname
            || ' '
            || m.emp_fname
    END AS manager_name,
    CASE
        WHEN e.emp_role = 'T' THEN
            to_char(COUNT(j.job_no))
    END AS jobs_dispatched
FROM
    employee e
    LEFT OUTER JOIN employee m ON e.emp_no_manager = m.emp_no
    LEFT OUTER JOIN job j ON e.emp_no = j.sched_emp_no
GROUP BY
    e.emp_no,
    e.emp_gname
    || ' '
    || e.emp_fname,
    e.emp_role,
    e.emp_no_manager,
    CASE
        WHEN e.emp_no_manager IS NULL THEN
            'No Manager'
        ELSE
            m.emp_gname
            || ' '
            || m.emp_fname
    END
ORDER BY
    e.emp_no;

/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    c.truck_vin,
    rpad(
        t.truck_rego,
        10,
        ' '
    ) AS truck_rego,
    rpad(
        c.trailer_code,
        12,
        ' '
    ) AS trailer_code,
    lpad(
        to_char(
            tr.trailer_purchase_cost,
            '$999,999.00'
        ),
        21,
        ' '
    ) AS trailer_purchase_cost,
    COUNT(j.job_no) AS num_jobs,
    lpad(
        CASE
            WHEN COUNT(j.job_no) = 0 THEN
                'No jobs'
            ELSE
                to_char(
                    SUM(q.quote_cost),
                    '$999,999.00'
                )
        END,
        17,
        ' '
    ) AS total_quoted_cost,
    CASE
        WHEN COUNT(j.job_no) = 0 THEN
            'Never Used'
        WHEN COUNT(j.job_no) > (
            SELECT
                AVG(COUNT(*))
            FROM
                job
            GROUP BY
                truck_vin,
                trailer_code
        ) THEN
            'High Use'
        ELSE
            'Standard Use'
    END AS usage
FROM
         combination c
    JOIN truck t ON c.truck_vin = t.truck_vin
    JOIN trailer tr ON c.trailer_code = tr.trailer_code
    LEFT OUTER JOIN job j ON c.truck_vin = j.truck_vin
                          AND c.trailer_code = j.trailer_code
    LEFT OUTER JOIN quote q ON j.quote_no = q.quote_no
GROUP BY
    c.truck_vin,
    t.truck_rego,
    c.trailer_code,
    tr.trailer_purchase_cost
ORDER BY
    COUNT(j.job_no) DESC,
    c.truck_vin,
    c.trailer_code;