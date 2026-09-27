--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: [student ID omitted]
--Student Name: Suchir Ganesh

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
DROP SEQUENCE employee_seq;
DROP SEQUENCE quote_seq;
DROP SEQUENCE job_seq;

CREATE SEQUENCE employee_seq
    START WITH 300
    INCREMENT BY 5;

CREATE SEQUENCE quote_seq
    START WITH 300
    INCREMENT BY 5;

CREATE SEQUENCE job_seq
    START WITH 300
    INCREMENT BY 5;

--3(b)

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
)
VALUES (
    employee_seq.NEXTVAL,
    'Aurello',
    'Brown',
    '0431952053',
    NULL,
    'T',
    (
        SELECT emp_no
        FROM employee
        WHERE emp_gname = 'Sarah'
          AND emp_fname = 'Mitchell'
          AND emp_role = 'B'
    )
);

COMMIT;


--3(c)
INSERT INTO quote (
    quote_no, quote_prepared_date,
    quote_pref_start_date, 
    quote_start_location,
    quote_end_location, quote_cost,
    cust_no, emp_no
)
VALUES (
    quote_seq.NEXTVAL, TO_DATE('17-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('25-May-2026', 'dd-Mon-yyyy'),
    '29 Kuranda Road, Adelaide SA 5030',
    '9 Albatros Drive, Mount Gambier SA 5270', 1000.00,
    (
        SELECT cust_no
        FROM customer
        WHERE UPPER(cust_gname) = 'VICTORIA'
          AND UPPER(cust_fname) = 'ELLA'
          AND UPPER(cust_bname) = UPPER('Flintstone Store')
    ),
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = 'AURELLO'
        AND UPPER(emp_fname) = 'BROWN'
        AND UPPER(emp_role) = 'T'
    )
);

INSERT INTO job (
    job_no, 
    job_pickup_dt,
    job_intended_dropoff_dt, 
    job_cost,
    job_payment_made, quote_no,
    sched_emp_no, driver_emp_no,
    trailer_code, truck_vin
)
VALUES (
    job_seq.NEXTVAL,
    TO_DATE('25-May-2026 09:00', 'dd-Mon-yyyy hh24:mi'),
    TO_DATE('25-May-2026 14:00', 'dd-Mon-yyyy hh24:mi'),
    NULL,
    'Y',
    quote_seq.CURRVAL,
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = UPPER('Aurello')
          AND UPPER(emp_fname) = UPPER('Brown')
          AND UPPER(emp_role) = 'T'
    ),
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = UPPER('Michael')
          AND UPPER(emp_fname) = UPPER('Johnson')
          AND UPPER(emp_role) = 'D'
    ),
    'TRL08',
    '1HGBH41JXMN109186'
);

COMMIT;

--3(d)
UPDATE job
SET
    job_pickup_dt = TO_DATE('25-May-2026 14:00', 'dd-Mon-yyyy hh24:mi'),
    job_intended_dropoff_dt = TO_DATE('25-May-2026 19:00', 'dd-Mon-yyyy hh24:mi'),
    job_cost = (
        SELECT quote_cost * 1.20
        FROM quote
        WHERE quote_prepared_date = TO_DATE('17-May-2026', 'dd-Mon-yyyy')
          AND cust_no = (
              SELECT cust_no
              FROM customer
              WHERE UPPER(cust_gname) = 'VICTORIA'
                AND UPPER(cust_fname) = 'ELLA'
                AND UPPER(cust_bname) = UPPER('Flintstone Store')
          )
    ),
    job_payment_made = 'Y'
WHERE quote_no = (
    SELECT quote_no
    FROM quote
    WHERE quote_prepared_date = TO_DATE('17-May-2026', 'dd-Mon-yyyy')
      AND cust_no = (
          SELECT cust_no
          FROM customer
          WHERE UPPER(cust_gname) = 'VICTORIA'
            AND UPPER(cust_fname) = 'ELLA'
            AND UPPER(cust_bname) = UPPER('Flintstone Store')
      )
);

COMMIT;


--3(e)

DELETE FROM job
WHERE quote_no = (
    SELECT quote_no
    FROM quote
    WHERE quote_prepared_date = TO_DATE('17-May-2026', 'dd-Mon-yyyy')
      AND cust_no = (
          SELECT cust_no
          FROM customer
          WHERE UPPER(cust_gname) = 'VICTORIA'
            AND UPPER(cust_fname) = 'ELLA'
            AND UPPER(cust_bname) = UPPER('Flintstone Store')
      )
);

COMMIT;
