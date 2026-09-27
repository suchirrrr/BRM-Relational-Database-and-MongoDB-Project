/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: [student ID omitted]
--Student Name: Suchir Ganesh

/*
Indicate if AI was used (Yes/No): Yes

If AI was used: 
I used Gemini.
 The generated output was reviewed and edited to remove Markdown formatting,
 ensure Oracle SQL syntax, check the required row counts, and confirm that 
 the data satisfies the Task 2 requirements.

I used these prompts:
I am completing Task 2 for a university Oracle SQL database assignment. Generate only the Oracle SQL INSERT statements for the EMPLOYEE, QUOTE, and JOB tables.

Do not generate the file header. Do not include the student ID section. Do not include Markdown formatting. Do not include lines such as --- or ##. Do not include SELECT statements, SPOOL, SET ECHO, ROLLBACK, PL/SQL, WITH, views, or sequences.

Use simple Oracle SQL only.

Use this section structure only:

--------------------------------------
--INSERT INTO employee
--------------------------------------

--------------------------------------
--INSERT INTO quote
--------------------------------------

--------------------------------------
--INSERT INTO job
--------------------------------------

End with one COMMIT only.

Tables:

EMPLOYEE(
emp_no NUMBER(3),
emp_gname VARCHAR(30),
emp_fname VARCHAR(30),
emp_contact_no CHAR(10),
emp_licenceno VARCHAR(11),
emp_role CHAR(1),
emp_no_manager NUMBER(3)
)

QUOTE(
quote_no NUMBER(5),
quote_prepared_date DATE,
quote_pref_start_date DATE,
quote_start_location VARCHAR(50),
quote_end_location VARCHAR(60),
quote_cost NUMBER(6,2),
cust_no NUMBER(4),
emp_no NUMBER(3)
)

JOB(
job_no NUMBER(5),
job_pickup_dt DATE,
job_intended_dropoff_dt DATE,
job_cost NUMBER(6,2),
job_payment_made CHAR(1),
quote_no NUMBER(5),
sched_emp_no NUMBER(3),
driver_emp_no NUMBER(3),
trailer_code CHAR(5),
truck_vin CHAR(17)
)

Generate exactly:
- 10 EMPLOYEE rows
- 30 QUOTE rows
- 20 JOB rows

EMPLOYEE requirements:
- At least 2 managers with emp_role = 'B'
- At least 2 truck dispatchers with emp_role = 'T'
- At least 1 mechanic with emp_role = 'M'
- At least 2 drivers with emp_role = 'D'
- Include one manager named Sarah Mitchell
- Include one driver named Michael Johnson
- Managers must have emp_no_manager NULL
- Non-managers must report to an existing manager
- Only drivers should have emp_licenceno values
- Non-drivers must have emp_licenceno NULL
- All emp_no values must be hardcoded and below 100
- All employee contact numbers must be unique
- Use INSERT INTO employee (column list) VALUES (...) format

QUOTE requirements:
- Generate exactly 30 quote rows
- quote_no values must be hardcoded and below 100
- Use only existing cust_no values from 1 to 20
- Use only employees with emp_role = 'T' as quote.emp_no
- Involve at least 5 different customers
- Involve at least 2 different truck dispatchers
- At least 2 customers must place at least 2 quotes each
- At least one Melbourne customer must have at least 2 quotes to support a later MongoDB query. Use one or more of these Melbourne customer numbers: 1, 4, 8, 17
- Create data so that at least one customer with more than one quote has an average quote cost above the overall average quote cost
- All dates must be between 1 May 2026 and 31 July 2026
- Use TO_DATE for every date
- quote_pref_start_date must be on or after quote_prepared_date
- quote_cost must be positive
- Use INSERT INTO quote (column list) VALUES (...) format

JOB requirements:
- Generate exactly 20 job rows
- job_no values must be hardcoded and below 100
- Every job must reference an existing quote_no from the generated quote rows
- Leave at least 2 quote rows unconverted, meaning those quote_no values must not appear in JOB
- Use only employees with emp_role = 'T' as sched_emp_no
- Use only employees with emp_role = 'D' as driver_emp_no
- job_payment_made must be either 'Y' or 'N'
- job_intended_dropoff_dt must be after job_pickup_dt
- All job dates must be between 1 May 2026 and 31 July 2026
- Use TO_DATE with time for job pickup and drop-off, for example TO_DATE('10-May-2026 09:00','dd-Mon-yyyy hh24:mi')
- Use INSERT INTO job (column list) VALUES (...) format
- Keep the JOB insert column order exactly as:
  job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin

Truck/trailer combination requirements:
- Use only these valid combinations.
- The combination values below are written in this order: trailer_code, truck_vin.
- At least 10 different truck/trailer combinations must be used in JOB.
- At least 5 truck/trailer combinations must be used in at least 2 jobs.

Valid combinations:
('TRL01','1HGBH41JXMN109186')
('TRL02','2FMDK3GC8BBA12345')
('TRL03','3VWFE21C04M000001')
('TRL04','4T1BF1FK5CU123456')
('TRL05','5FNRL5H40BB098765')
('TRL06','1FTFW1ET5DFC10112')
('TRL07','2C4RDGCG8ER123789')
('TRL08','5XYKT3A69CG234567')
('TRL05','1HGBH41JXMN109186')
('TRL08','2FMDK3GC8BBA12345')
('TRL01','3VWFE21C04M000001')
('TRL07','4T1BF1FK5CU123456')
('TRL02','5FNRL5H40BB098765')
('TRL04','1FTFW1ET5DFC10112')
('TRL03','2C4RDGCG8ER123789')
('TRL06','5XYKT3A69CG234567')
('TRL08','1HGBH41JXMN109186')
('TRL01','2FMDK3GC8BBA12345')

Important job_cost rule:
- job_cost is the revised job cost and should only be recorded when it is different from the quote cost.
- At least 5 jobs must have job_cost different from the related quote_cost. For these jobs, use a non-NULL job_cost value.
- At least 5 jobs must have the same final cost as the quote. For these same-cost jobs, set job_cost to NULL.
- Do not put the same numeric value as the quote cost into job_cost.

Formatting requirements:
- Add short useful SQL comments before each table section.
- Add short comments for key rows, such as Sarah Mitchell, Michael Johnson, unconverted quotes, same-cost jobs, and repeated truck/trailer combinations.
- Treat all inserted data as one transaction.
- Add exactly one COMMIT only at the end.
- Do not modify existing CUSTOMER, TRUCK, TRAILER, or COMBINATION data.
- Return only valid Oracle SQL insert script content.
*/

-- AI Output:

--------------------------------------
--INSERT INTO employee
--------------------------------------
-- Manager 1 (Sarah Mitchell)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (1, 'Sarah', 'Mitchell', '0411111111', NULL, 'B', NULL);
-- Manager 2
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (2, 'John', 'Smith', '0422222222', NULL, 'B', NULL);
-- Truck Dispatcher 1
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (3, 'Robert', 'Davis', '0433333333', NULL, 'T', 1);
-- Truck Dispatcher 2
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (4, 'Emily', 'Wilson', '0444444444', NULL, 'T', 1);
-- Mechanic 1
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (5, 'David', 'Brown', '0455555555', NULL, 'M', 2);
-- Driver 1 (Michael Johnson)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (6, 'Michael', 'Johnson', '0466666666', 'LIC12345678', 'D', 2);
-- Driver 2
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (7, 'James', 'Miller', '0477777777', 'LIC87654321', 'D', 2);
-- Driver 3
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (8, 'Jessica', 'Taylor', '0488888888', 'LIC11223344', 'D', 1);
-- Driver 4
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (9, 'Daniel', 'Anderson', '0499999999', 'LIC55667788', 'D', 1);
-- Driver 5
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) VALUES (10, 'Paul', 'Thomas', '0400000000', 'LIC99001122', 'D', 2);

--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Melbourne Customer 1 with 2 high-cost quotes (Average 8000.00, exceeds overall average)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (1, TO_DATE('01-May-2026', 'dd-Mon-yyyy'), TO_DATE('05-May-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 7500.00, 1, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (2, TO_DATE('02-May-2026', 'dd-Mon-yyyy'), TO_DATE('06-May-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Brisbane', 8500.00, 1, 3);

-- Customer 2 with 2 quotes
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (3, TO_DATE('05-May-2026', 'dd-Mon-yyyy'), TO_DATE('10-May-2026', 'dd-Mon-yyyy'), 'Sydney', 'Melbourne', 1200.00, 2, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (4, TO_DATE('06-May-2026', 'dd-Mon-yyyy'), TO_DATE('11-May-2026', 'dd-Mon-yyyy'), 'Sydney', 'Adelaide', 1500.00, 2, 4);

-- Unconverted Quotes (Will not appear in JOB table)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (5, TO_DATE('10-May-2026', 'dd-Mon-yyyy'), TO_DATE('15-May-2026', 'dd-Mon-yyyy'), 'Geelong', 'Ballarat', 450.00, 3, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (6, TO_DATE('11-May-2026', 'dd-Mon-yyyy'), TO_DATE('16-May-2026', 'dd-Mon-yyyy'), 'Bendigo', 'Melbourne', 600.00, 4, 4);

-- Quotes for Jobs 1 to 5 (Revised cost jobs, job_cost is non-NULL)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (7, TO_DATE('12-May-2026', 'dd-Mon-yyyy'), TO_DATE('17-May-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Sydney', 2000.00, 5, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (8, TO_DATE('13-May-2026', 'dd-Mon-yyyy'), TO_DATE('18-May-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Melbourne', 2500.00, 6, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (9, TO_DATE('14-May-2026', 'dd-Mon-yyyy'), TO_DATE('19-May-2026', 'dd-Mon-yyyy'), 'Perth', 'Adelaide', 3500.00, 7, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (10, TO_DATE('15-May-2026', 'dd-Mon-yyyy'), TO_DATE('20-May-2026', 'dd-Mon-yyyy'), 'Hobart', 'Melbourne', 1800.00, 8, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (11, TO_DATE('16-May-2026', 'dd-Mon-yyyy'), TO_DATE('21-May-2026', 'dd-Mon-yyyy'), 'Darwin', 'Brisbane', 4000.00, 9, 3);

-- Quotes for Jobs 6 to 10 (Same cost jobs, job_cost will be NULL)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (12, TO_DATE('17-May-2026', 'dd-Mon-yyyy'), TO_DATE('22-May-2026', 'dd-Mon-yyyy'), 'Newcastle', 'Sydney', 800.00, 10, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (13, TO_DATE('18-May-2026', 'dd-Mon-yyyy'), TO_DATE('23-May-2026', 'dd-Mon-yyyy'), 'Wollongong', 'Canberra', 950.00, 11, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (14, TO_DATE('19-May-2026', 'dd-Mon-yyyy'), TO_DATE('24-May-2026', 'dd-Mon-yyyy'), 'Canberra', 'Melbourne', 1100.00, 12, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (15, TO_DATE('20-May-2026', 'dd-Mon-yyyy'), TO_DATE('25-May-2026', 'dd-Mon-yyyy'), 'Gold Coast', 'Brisbane', 700.00, 13, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (16, TO_DATE('21-May-2026', 'dd-Mon-yyyy'), TO_DATE('26-May-2026', 'dd-Mon-yyyy'), 'Cairns', 'Townsville', 1300.00, 14, 4);

-- Quotes for remaining Jobs 11 to 20
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (17, TO_DATE('22-May-2026', 'dd-Mon-yyyy'), TO_DATE('27-May-2026', 'dd-Mon-yyyy'), 'Albury', 'Sydney', 900.00, 15, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (18, TO_DATE('23-May-2026', 'dd-Mon-yyyy'), TO_DATE('28-May-2026', 'dd-Mon-yyyy'), 'Mildura', 'Melbourne', 1050.00, 16, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (19, TO_DATE('24-May-2026', 'dd-Mon-yyyy'), TO_DATE('29-May-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Geelong', 500.00, 17, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (20, TO_DATE('25-May-2026', 'dd-Mon-yyyy'), TO_DATE('30-May-2026', 'dd-Mon-yyyy'), 'Toowoomba', 'Brisbane', 650.00, 18, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (21, TO_DATE('26-May-2026', 'dd-Mon-yyyy'), TO_DATE('31-May-2026', 'dd-Mon-yyyy'), 'Mackay', 'Rockhampton', 1150.00, 19, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (22, TO_DATE('27-May-2026', 'dd-Mon-yyyy'), TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'), 'Bunbury', 'Perth', 850.00, 20, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (23, TO_DATE('28-May-2026', 'dd-Mon-yyyy'), TO_DATE('02-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Adelaide', 1900.00, 1, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (24, TO_DATE('29-May-2026', 'dd-Mon-yyyy'), TO_DATE('03-Jun-2026', 'dd-Mon-yyyy'), 'Sydney', 'Newcastle', 750.00, 2, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (25, TO_DATE('30-May-2026', 'dd-Mon-yyyy'), TO_DATE('04-Jun-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Gold Coast', 680.00, 13, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (26, TO_DATE('31-May-2026', 'dd-Mon-yyyy'), TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Melbourne', 1750.00, 5, 4);

-- Additional remaining quotes to reach exactly 30 rows
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (27, TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('06-Jun-2026', 'dd-Mon-yyyy'), 'Perth', 'Fremantle', 400.00, 7, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (28, TO_DATE('02-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('07-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 2200.00, 8, 4);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (29, TO_DATE('03-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('08-Jun-2026', 'dd-Mon-yyyy'), 'Sydney', 'Brisbane', 2600.00, 9, 3);
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) VALUES (30, TO_DATE('04-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('09-Jun-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Sydney', 2400.00, 10, 4);

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Jobs 1 to 5: Revised job costs (job_cost != quote_cost)
-- Combination 1 (Repeated 1/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (1, TO_DATE('05-May-2026 08:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('06-May-2026 17:00', 'dd-Mon-yyyy hh24:mi'), 7800.00, 'Y', 1, 3, 6, 'TRL01', '1HGBH41JXMN109186');
-- Combination 2 (Repeated 1/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (2, TO_DATE('06-May-2026 09:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('08-May-2026 12:00', 'dd-Mon-yyyy hh24:mi'), 8200.00, 'Y', 2, 3, 7, 'TRL02', '2FMDK3GC8BBA12345');
-- Combination 3 (Repeated 1/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (3, TO_DATE('10-May-2026 07:30', 'dd-Mon-yyyy hh24:mi'), TO_DATE('11-May-2026 16:30', 'dd-Mon-yyyy hh24:mi'), 1300.00, 'Y', 3, 4, 8, 'TRL03', '3VWFE21C04M000001');
-- Combination 4 (Repeated 1/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (4, TO_DATE('11-May-2026 08:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('12-May-2026 18:00', 'dd-Mon-yyyy hh24:mi'), 1650.00, 'N', 4, 4, 9, 'TRL04', '4T1BF1FK5CU123456');
-- Combination 5 (Repeated 1/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (5, TO_DATE('17-May-2026 06:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('18-May-2026 14:00', 'dd-Mon-yyyy hh24:mi'), 2100.00, 'Y', 7, 3, 10, 'TRL05', '5FNRL5H40BB098765');

-- Jobs 6 to 10: Same final cost as quote (job_cost is NULL)
-- Combination 1 (Repeated 2/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (6, TO_DATE('18-May-2026 07:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('20-May-2026 11:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 8, 4, 6, 'TRL01', '1HGBH41JXMN109186');
-- Combination 2 (Repeated 2/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (7, TO_DATE('19-May-2026 10:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('21-May-2026 15:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'N', 9, 3, 7, 'TRL02', '2FMDK3GC8BBA12345');
-- Combination 3 (Repeated 2/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (8, TO_DATE('20-May-2026 08:30', 'dd-Mon-yyyy hh24:mi'), TO_DATE('21-May-2026 17:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 10, 4, 8, 'TRL03', '3VWFE21C04M000001');
-- Combination 4 (Repeated 2/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (9, TO_DATE('21-May-2026 05:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('23-May-2026 13:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 11, 3, 9, 'TRL04', '4T1BF1FK5CU123456');
-- Combination 5 (Repeated 2/2)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (10, TO_DATE('22-May-2026 09:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('22-May-2026 16:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'N', 12, 4, 10, 'TRL05', '5FNRL5H40BB098765');

-- Jobs 11 to 20: Remaining unique truck/trailer combinations to reach 10 distinct pairs
-- Combination 6
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (11, TO_DATE('23-May-2026 08:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('23-May-2026 14:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 13, 3, 6, 'TRL06', '1FTFW1ET5DFC10112');
-- Combination 7
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (12, TO_DATE('24-May-2026 07:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('25-May-2026 12:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 14, 4, 7, 'TRL07', '2C4RDGCG8ER123789');
-- Combination 8
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (13, TO_DATE('25-May-2026 11:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('25-May-2026 15:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'N', 15, 3, 8, 'TRL08', '5XYKT3A69CG234567');
-- Combination 9
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (14, TO_DATE('26-May-2026 06:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('27-May-2026 18:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 16, 4, 9, 'TRL05', '1HGBH41JXMN109186');
-- Combination 10
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (15, TO_DATE('27-May-2026 08:30', 'dd-Mon-yyyy hh24:mi'), TO_DATE('28-May-2026 11:30', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 17, 3, 10, 'TRL08', '2FMDK3GC8BBA12345');
-- Reuse Combination 6
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (16, TO_DATE('28-May-2026 09:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('29-May-2026 15:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'N', 18, 4, 6, 'TRL06', '1FTFW1ET5DFC10112');
-- Reuse Combination 7
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (17, TO_DATE('29-May-2026 08:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('29-May-2026 12:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 19, 3, 7, 'TRL07', '2C4RDGCG8ER123789');
-- Reuse Combination 8
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (18, TO_DATE('30-May-2026 10:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('30-May-2026 14:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 20, 4, 8, 'TRL08', '5XYKT3A69CG234567');
-- Reuse Combination 9
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (19, TO_DATE('01-Jun-2026 07:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('02-Jun-2026 16:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'N', 21, 3, 9, 'TRL05', '1HGBH41JXMN109186');
-- Reuse Combination 10
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) VALUES (20, TO_DATE('02-Jun-2026 08:00', 'dd-Mon-yyyy hh24:mi'), TO_DATE('02-Jun-2026 13:00', 'dd-Mon-yyyy hh24:mi'), NULL, 'Y', 22, 4, 10, 'TRL08', '2FMDK3GC8BBA12345');

COMMIT;

