--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: [student ID omitted]
--Student Name: Suchir Ganesh

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--4(a)
ALTER TABLE quote ADD (
    quote_current_status CHAR(1) DEFAULT 'N' NOT NULL,
    quote_not_assigned_reason VARCHAR2(200),
    CONSTRAINT chk_quote_current_status
        CHECK (quote_current_status IN ('Y', 'N'))
);

COMMENT ON COLUMN quote.quote_current_status IS
    'Indicates whether the quote has been assigned to a job (Y/N)';

COMMENT ON COLUMN quote.quote_not_assigned_reason IS
    'Reason why the quote was not assigned to a job';


-- Set status to 'Y' for quotes that have been assigned to a job
UPDATE quote
SET quote_current_status = 'Y'
WHERE quote_no IN (
    SELECT quote_no
    FROM job
);

-- Set status to 'N' for quotes that have not been assigned to a job
UPDATE quote
SET quote_current_status = 'N'
WHERE quote_no NOT IN (
    SELECT quote_no
    FROM job
);

COMMIT;

DESC quote;

SELECT
    quote_no,
    quote_current_status,
    quote_not_assigned_reason
FROM quote
ORDER BY quote_no;


--4(b)
-- created service table
CREATE TABLE service (
    service_no NUMBER(5) NOT NULL,
    service_start_date DATE NOT NULL,
    service_end_date DATE,
    truck_vin CHAR(17) NOT NULL
);

COMMENT ON COLUMN service.service_no IS
    'Service number';

COMMENT ON COLUMN service.service_start_date IS
    'Start date and time of the truck service';

COMMENT ON COLUMN service.service_end_date IS
    'End date and time of the truck service';

COMMENT ON COLUMN service.truck_vin IS
    'Vehicle Identification Number (VIN) of the truck being serviced';

ALTER TABLE service ADD CONSTRAINT service_pk
    PRIMARY KEY (service_no);

ALTER TABLE service ADD CONSTRAINT service_end_after_start_chk
    CHECK (service_end_date IS NULL OR service_end_date > service_start_date);

-- created service task
CREATE TABLE service_task (
    service_task_no NUMBER(3) NOT NULL,
    service_task_name VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN service_task.service_task_no IS
    'Service task number';

COMMENT ON COLUMN service_task.service_task_name IS
    'Service task name';

ALTER TABLE service_task ADD CONSTRAINT service_task_pk
    PRIMARY KEY (service_task_no);

ALTER TABLE service_task ADD CONSTRAINT service_task_name_uq
    UNIQUE (service_task_name);


--created service task assignment
CREATE TABLE service_task_assignment (
    service_no NUMBER(5) NOT NULL,
    service_task_no NUMBER(3) NOT NULL,
    emp_no NUMBER(3) NOT NULL,
    service_task_notes VARCHAR2(200)
);

COMMENT ON COLUMN service_task_assignment.service_no IS
    'Service number';

COMMENT ON COLUMN service_task_assignment.service_task_no IS
    'Service task number';

COMMENT ON COLUMN service_task_assignment.emp_no IS
    'Employee number of the mechanic assigned to the service task';

COMMENT ON COLUMN service_task_assignment.service_task_notes IS
    'Free text note explaining the service task';

ALTER TABLE service_task_assignment ADD CONSTRAINT service_task_assignment_pk
    PRIMARY KEY (service_no, service_task_no);

-- FK Constraints 
ALTER TABLE service ADD CONSTRAINT truck_service_fk
    FOREIGN KEY (truck_vin)
    REFERENCES truck (truck_vin);

ALTER TABLE service_task_assignment ADD CONSTRAINT service_sta_fk
    FOREIGN KEY (service_no)
    REFERENCES service (service_no);

ALTER TABLE service_task_assignment ADD CONSTRAINT service_task_sta_fk
    FOREIGN KEY (service_task_no)
    REFERENCES service_task (service_task_no);

ALTER TABLE service_task_assignment ADD CONSTRAINT employee_sta_fk
    FOREIGN KEY (emp_no)
    REFERENCES employee (emp_no);

COMMIT;

-- Display the schema for the service management tables
DESC service;

DESC service_task;

DESC service_task_assignment;