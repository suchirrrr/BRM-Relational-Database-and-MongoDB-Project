/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

--Student ID: [student ID omitted]
--Student Name: Suchir Ganesh

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
--6(a)
SELECT
    JSON_OBJECT(
        '_id' VALUE c.cust_no,
        'customer_name' VALUE trim(
            nvl(c.cust_gname, '')
            || ' '
            || nvl(c.cust_fname, '')
        ),
        'customer_business' VALUE nvl(c.cust_bname, '-'),
        'customer_address' VALUE c.cust_street
                                  || ', '
                                  || c.cust_town
                                  || ', '
                                  || c.cust_pcode,
        'customer_phone' VALUE c.cust_contact_no,
        'customer_stats' VALUE JSON_OBJECT
        (
        'number_of_quotes' VALUE COUNT(q.quote_no),
        'number_of_jobs' VALUE COUNT(j.job_no),
        'total_paid_jobcost' VALUE
            CASE
                WHEN SUM(
                    CASE
                        WHEN j.job_payment_made = 'Y' THEN
                            nvl(j.job_cost, q.quote_cost)
                        ELSE
                            0
                    END
                ) = 0 THEN
                    '-'
            ELSE
                to_char(
                    SUM(
                        CASE
                            WHEN j.job_payment_made = 'Y' THEN
                                nvl(j.job_cost, q.quote_cost)
                        ELSE
                            0
                        END
                        ),
                            '$999,999.00'
                        )
            END,
            'total_unpaid_jobcost' VALUE
                CASE
                    WHEN SUM(
                        CASE
                            WHEN j.job_payment_made = 'N' THEN
                                nvl(j.job_cost, q.quote_cost)
                            ELSE
                                0
                        END
                    ) = 0 THEN
                        '-'
                    ELSE
                        to_char(
                            SUM(
                                CASE
                                    WHEN j.job_payment_made = 'N' THEN
                                        nvl(j.job_cost, q.quote_cost)
                                    ELSE
                                        0
                                END
                            ),
                            '$999,999.00'
                        )
                END
        ),
        'quotes' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'quote_no' VALUE q.quote_no,
                'quote_prepared_on' VALUE to_char(q.quote_prepared_date, 'dd-Mon-yyyy'),
                'preferred_start_date' VALUE to_char(q.quote_pref_start_date, 'dd-Mon-yyyy'),
                'start_location' VALUE q.quote_start_location,
                'end_location' VALUE q.quote_end_location,
                'quote_cost' VALUE to_char(q.quote_cost, '$999,999.00'),
                'assigned_to_job' VALUE q.quote_current_status,
                'job_cost' VALUE
                    CASE
                        WHEN j.job_no IS NULL THEN
                            '-'
                        WHEN j.job_cost IS NULL THEN
                            to_char(q.quote_cost, '$999,999.00')
                        ELSE
                            to_char(j.job_cost, '$999,999.00')
                    END
            )
            ORDER BY q.quote_no
        ) 
    FORMAT JSON )
    || ','
FROM
    customer c
    JOIN quote q ON c.cust_no = q.cust_no
    LEFT OUTER JOIN job j ON q.quote_no = j.quote_no
GROUP BY
    c.cust_no,
    c.cust_gname,
    c.cust_fname,
    c.cust_bname,
    c.cust_street,
    c.cust_town,
    c.cust_pcode,
    c.cust_contact_no
ORDER BY
    c.cust_no;
