# BRM Database Project

Oracle SQL and MongoDB coursework for FIT2094, covering transport quotations, jobs, employees and vehicle servicing.

## Project work

- Defined employee, quote and job tables with primary, foreign, unique and check constraints.
- Inserted test data and implemented transaction-based changes and sequences.
- Extended the model with service, service-task and task-assignment tables.
- Wrote reporting queries with joins, aggregation, subqueries and date handling.
- Generated nested JSON customer documents and implemented MongoDB queries and updates.

## Files

| Script | Purpose |
| --- | --- |
| T1-brm-schema.sql | Table definitions and integrity constraints |
| T2-brm-insert.sql | Test data |
| T3-brm-dm.sql | Sequences and data manipulation |
| T4-brm-mods.sql | Schema extensions |
| T5-brm-select.sql | Reporting queries |
| T6-brm-json.sql | Relational data to nested JSON |
| T6-brm-mongo.mongodb.js | MongoDB collection operations |

## Running and limitations

The Oracle scripts depend on the course-provided base schema and seed data (including customer, truck, trailer and combination tables), which are not included here. They are not a standalone database installer. Run only in a disposable coursework database: scripts contain table drops and data mutations.

Run T1 through T6 in order after loading the original base schema. Use the MongoDB script in a MongoDB playground with a disposable `brm_portfolio` database. Query output depends on the initial seed data.

The original query logic and submission declarations are retained. Portfolio preparation removes the student ID and changes the MongoDB database name. Marking feedback and private submission documents are excluded. These scripts have not been rerun against Oracle or MongoDB in this portfolio environment.

## Project visual

![Project architecture](docs/brm-overview.png)
