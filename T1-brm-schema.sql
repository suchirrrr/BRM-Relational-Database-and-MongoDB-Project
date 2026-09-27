--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-brm-schema.sql

--Student ID: [student ID omitted]
--Student Name: Suchir Ganesh

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/


/* drop table statements - do not remove*/

DROP TABLE employee CASCADE CONSTRAINTS PURGE;

DROP TABLE job CASCADE CONSTRAINTS PURGE;

DROP TABLE quote CASCADE CONSTRAINTS PURGE;

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- EMPLOYEE
CREATE TABLE employee (
    emp_no         NUMBER(3)   NOT NULL,
    emp_gname      VARCHAR(30) NOT NULL,
    emp_fname      VARCHAR(30) NOT NULL,
    emp_contact_no  CHAR(10)   NOT NULL,
    emp_licenceno   VARCHAR(11),
    emp_role        CHAR(1)   NOT NULL,
    emp_no_manager NUMBER(3)  
);

COMMENT ON COLUMN employee.emp_no IS
    'Employee number';

COMMENT ON COLUMN employee.emp_gname IS
    'Employee given name';

COMMENT ON COLUMN employee.emp_fname IS
    'Employee family name';

COMMENT ON COLUMN employee.emp_contact_no IS
    'Employee contact number';

COMMENT ON COLUMN employee.emp_licenceno IS
    'Employee licence number';

COMMENT ON COLUMN employee.emp_role IS
    'Employee role';

COMMENT ON COLUMN employee.emp_no_manager IS
    'Employee number of the manager supervising this employee';

ALTER TABLE employee ADD CONSTRAINT employee_pk
    PRIMARY KEY (emp_no);

ALTER TABLE employee ADD CONSTRAINT employee_contact_no_uq
    UNIQUE (emp_contact_no);

ALTER TABLE employee ADD CONSTRAINT emp_licenceno_uq
    UNIQUE(emp_licenceno);

ALTER TABLE employee ADD CONSTRAINT employee_role_chk
    CHECK (emp_role IN ('B', 'T', 'M', 'D'));

-- JOB
CREATE TABLE job (
    job_no                   NUMBER(5)    NOT NULL,
    job_pickup_dt            DATE         NOT NULL,
    job_intended_dropoff_dt  DATE         NOT NULL,
    job_cost                 NUMBER(6,2),
    job_payment_made         CHAR(1)      NOT NULL,
    quote_no                 NUMBER(5)    NOT NULL,
    sched_emp_no             NUMBER(3)    NOT NULL,
    driver_emp_no            NUMBER(3)    NOT NULL,
    trailer_code             CHAR(5)      NOT NULL,
    truck_vin                CHAR(17)     NOT NULL
);

COMMENT ON COLUMN job.job_no IS
    'Job number';

COMMENT ON COLUMN job.job_pickup_dt IS
    'Date on which the job pickup is scheduled';

COMMENT ON COLUMN job.job_intended_dropoff_dt IS
    'Intended date for delivery or drop-off of the job';

COMMENT ON COLUMN job.job_cost IS
    'Cost charged for completing the job';

COMMENT ON COLUMN job.job_payment_made IS
    'Indicates whether payment has been made for the job (Y/N)';

COMMENT ON COLUMN job.quote_no IS
    'Quote number assigned to the job';

COMMENT ON COLUMN job.sched_emp_no IS
    'Employee number of the dispatcher who scheduled the job';

COMMENT ON COLUMN job.driver_emp_no IS
    'Employee number of the driver assigned to the job';

COMMENT ON COLUMN job.trailer_code IS
    'Trailer code assigned to the job';

COMMENT ON COLUMN job.truck_vin IS
    'Truck VIN assigned to the job';

ALTER TABLE job ADD CONSTRAINT job_no_pk
    PRIMARY KEY (job_no);

ALTER TABLE job ADD CONSTRAINT job_payment_made_chk
    CHECK (job_payment_made IN ('Y', 'N'));

ALTER TABLE job ADD CONSTRAINT job_dropoff_after_pickup_chk
    CHECK (job_intended_dropoff_dt > job_pickup_dt);

-- QUOTE

CREATE TABLE quote (
    quote_no                 NUMBER(5)    NOT NULL,
    quote_prepared_date      DATE         NOT NULL,
    quote_pref_start_date    DATE         NOT NULL,
    quote_start_location     VARCHAR(50) NOT NULL,
    quote_end_location       VARCHAR(60) NOT NULL,
    quote_cost               NUMBER(6,2)  NOT NULL,
    cust_no                  NUMBER(4)    NOT NULL,
    emp_no                   NUMBER(3)    NOT NULL
);

COMMENT ON TABLE quote IS
    'Stores customer quotations for transportation services';

COMMENT ON COLUMN quote.quote_no IS
    'Quote number';

COMMENT ON COLUMN quote.quote_prepared_date IS
    'Date on which the quote was prepared';

COMMENT ON COLUMN quote.quote_pref_start_date IS
    'Customer preferred start date for the transportation job';

COMMENT ON COLUMN quote.quote_start_location IS
    'Starting location of the transportation job';

COMMENT ON COLUMN quote.quote_end_location IS
    'Destination location of the transportation job';

COMMENT ON COLUMN quote.quote_cost IS
    'Estimated cost of the transportation job';

COMMENT ON COLUMN quote.cust_no IS
    'Customer number associated with the quote';

COMMENT ON COLUMN quote.emp_no IS
    'Employee number of the employee who prepared the quote';

ALTER TABLE quote ADD CONSTRAINT quote_no_pk
    PRIMARY KEY (quote_no);

ALTER TABLE quote ADD CONSTRAINT quote_cost_chk
    CHECK (quote_cost > 0);

ALTER TABLE quote ADD CONSTRAINT quote_pref_date_chk
    CHECK (quote_pref_start_date >= quote_prepared_date);

-- Add all missing FK Constraints below here
ALTER TABLE employee ADD CONSTRAINT employee_manager_fk
    FOREIGN KEY (emp_no_manager)
    REFERENCES employee (emp_no);

ALTER TABLE quote ADD CONSTRAINT quote_customer_fk
    FOREIGN KEY (cust_no)
    REFERENCES customer (cust_no);

ALTER TABLE quote ADD CONSTRAINT quote_employee_fk
    FOREIGN KEY (emp_no)
    REFERENCES employee (emp_no);

ALTER TABLE job ADD CONSTRAINT job_quote_fk
    FOREIGN KEY (quote_no)
    REFERENCES quote (quote_no);

ALTER TABLE job ADD CONSTRAINT job_sched_employee_fk
    FOREIGN KEY (sched_emp_no)
    REFERENCES employee (emp_no);

ALTER TABLE job ADD CONSTRAINT job_driver_employee_fk
    FOREIGN KEY (driver_emp_no)
    REFERENCES employee (emp_no);

ALTER TABLE job ADD CONSTRAINT job_combination_fk
    FOREIGN KEY (trailer_code, truck_vin)
    REFERENCES combination (trailer_code, truck_vin);
