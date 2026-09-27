// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-brm-mongo.mongodb.js

// Student ID: [student ID omitted]
// Student Name: Suchir Ganesh

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// Do not use .pretty() in your code, it is not required
//
// -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
// In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("brm_portfolio");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of t his answer

// Drop collection
db.brm_customer.drop();

// Create collection and insert documents
db.brm_customer.insertMany([
    {"_id":1,"customer_name":"Michael Benjamin","customer_business":"FreshBox","customer_address":"55 Lonsdale Street, Melbourne, 3008","customer_phone":"0478901017","customer_stats":{"number_of_quotes":3,"number_of_jobs":2,"total_paid_jobcost":"$16,000.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":1,"quote_prepared_on":"01-May-2026","preferred_start_date":"05-May-2026","start_location":"Melbourne","end_location":"Sydney","quote_cost":"$7,500.00","assigned_to_job":"Y","job_cost":"$7,800.00"},{"quote_no":2,"quote_prepared_on":"02-May-2026","preferred_start_date":"06-May-2026","start_location":"Melbourne","end_location":"Brisbane","quote_cost":"$8,500.00","assigned_to_job":"Y","job_cost":"$8,200.00"},{"quote_no":23,"quote_prepared_on":"28-May-2026","preferred_start_date":"02-Jun-2026","start_location":"Melbourne","end_location":"Adelaide","quote_cost":"$1,900.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":2,"customer_name":"James","customer_business":"J Wood and Gravel","customer_address":"15 George Street, Sydney, 2000","customer_phone":"0412345001","customer_stats":{"number_of_quotes":3,"number_of_jobs":2,"total_paid_jobcost":"$1,300.00","total_unpaid_jobcost":"$1,650.00"},"quotes":[{"quote_no":3,"quote_prepared_on":"05-May-2026","preferred_start_date":"10-May-2026","start_location":"Sydney","end_location":"Melbourne","quote_cost":"$1,200.00","assigned_to_job":"Y","job_cost":"$1,300.00"},{"quote_no":4,"quote_prepared_on":"06-May-2026","preferred_start_date":"11-May-2026","start_location":"Sydney","end_location":"Adelaide","quote_cost":"$1,500.00","assigned_to_job":"Y","job_cost":"$1,650.00"},{"quote_no":24,"quote_prepared_on":"29-May-2026","preferred_start_date":"03-Jun-2026","start_location":"Sydney","end_location":"Newcastle","quote_cost":"$750.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":3,"customer_name":"Brook","customer_business":"Western Chocolatery","customer_address":"23 Murray Street, Perth, 6000","customer_phone":"0445678004","customer_stats":{"number_of_quotes":1,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":5,"quote_prepared_on":"10-May-2026","preferred_start_date":"15-May-2026","start_location":"Geelong","end_location":"Ballarat","quote_cost":"$450.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":4,"customer_name":"Alexander Noah","customer_business":"-","customer_address":"56 Bourke Street, Melbourne, 3001","customer_phone":"0478901007","customer_stats":{"number_of_quotes":1,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":6,"quote_prepared_on":"11-May-2026","preferred_start_date":"16-May-2026","start_location":"Bendigo","end_location":"Melbourne","quote_cost":"$600.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":5,"customer_name":"Jack Ethan","customer_business":"-","customer_address":"61 Ann Street, Brisbane, 4101","customer_phone":"0434567013","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"$2,100.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":7,"quote_prepared_on":"12-May-2026","preferred_start_date":"17-May-2026","start_location":"Adelaide","end_location":"Sydney","quote_cost":"$2,000.00","assigned_to_job":"Y","job_cost":"$2,100.00"},{"quote_no":26,"quote_prepared_on":"31-May-2026","preferred_start_date":"05-Jun-2026","start_location":"Adelaide","end_location":"Melbourne","quote_cost":"$1,750.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":6,"customer_name":"Sophie Amelia","customer_business":"-","customer_address":"29 Barrack Street, Perth, 6009","customer_phone":"0445678014","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$2,500.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":8,"quote_prepared_on":"13-May-2026","preferred_start_date":"18-May-2026","start_location":"Brisbane","end_location":"Melbourne","quote_cost":"$2,500.00","assigned_to_job":"Y","job_cost":"$2,500.00"}]},
    {"_id":7,"customer_name":"Kate Evelyn","customer_business":"Miller Co.","customer_address":"72 Cavill Avenue, Brisbane, 4217","customer_phone":"0489012018","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"-","total_unpaid_jobcost":"$3,500.00"},"quotes":[{"quote_no":9,"quote_prepared_on":"14-May-2026","preferred_start_date":"19-May-2026","start_location":"Perth","end_location":"Adelaide","quote_cost":"$3,500.00","assigned_to_job":"Y","job_cost":"$3,500.00"},{"quote_no":27,"quote_prepared_on":"01-Jun-2026","preferred_start_date":"06-Jun-2026","start_location":"Perth","end_location":"Fremantle","quote_cost":"$400.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":8,"customer_name":"Emma","customer_business":"Kreate Curtain","customer_address":"42 Collins Street, Melbourne, 3000","customer_phone":"0423456002","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"$1,800.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":10,"quote_prepared_on":"15-May-2026","preferred_start_date":"20-May-2026","start_location":"Hobart","end_location":"Melbourne","quote_cost":"$1,800.00","assigned_to_job":"Y","job_cost":"$1,800.00"},{"quote_no":28,"quote_prepared_on":"02-Jun-2026","preferred_start_date":"07-Jun-2026","start_location":"Melbourne","end_location":"Sydney","quote_cost":"$2,200.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":9,"customer_name":"William","customer_business":"Best Fruit and Veg","customer_address":"67 King William Street, Adelaide, 5000","customer_phone":"0456789005","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"$4,000.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":11,"quote_prepared_on":"16-May-2026","preferred_start_date":"21-May-2026","start_location":"Darwin","end_location":"Brisbane","quote_cost":"$4,000.00","assigned_to_job":"Y","job_cost":"$4,000.00"},{"quote_no":29,"quote_prepared_on":"03-Jun-2026","preferred_start_date":"08-Jun-2026","start_location":"Sydney","end_location":"Brisbane","quote_cost":"$2,600.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":10,"customer_name":"Grace","customer_business":"-","customer_address":"45 Rundle Mall, Adelaide, 5006","customer_phone":"0401234010","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"-","total_unpaid_jobcost":"$800.00"},"quotes":[{"quote_no":12,"quote_prepared_on":"17-May-2026","preferred_start_date":"22-May-2026","start_location":"Newcastle","end_location":"Sydney","quote_cost":"$800.00","assigned_to_job":"Y","job_cost":"$800.00"},{"quote_no":30,"quote_prepared_on":"04-Jun-2026","preferred_start_date":"09-Jun-2026","start_location":"Brisbane","end_location":"Sydney","quote_cost":"$2,400.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":11,"customer_name":"Rose Isabella","customer_business":"-","customer_address":"34 Adelaide Street, Brisbane, 4006","customer_phone":"0489012008","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$950.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":13,"quote_prepared_on":"18-May-2026","preferred_start_date":"23-May-2026","start_location":"Wollongong","end_location":"Canberra","quote_cost":"$950.00","assigned_to_job":"Y","job_cost":"$950.00"}]},
    {"_id":12,"customer_name":"Robert James","customer_business":"Wilson Confectionery","customer_address":"38 Wellington Street, Perth, 6107","customer_phone":"0490123019","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$1,100.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":14,"quote_prepared_on":"19-May-2026","preferred_start_date":"24-May-2026","start_location":"Canberra","end_location":"Melbourne","quote_cost":"$1,100.00","assigned_to_job":"Y","job_cost":"$1,100.00"}]},
    {"_id":13,"customer_name":"Oliver","customer_business":"Williams Co.","customer_address":"88 Queen Street, Brisbane, 4000","customer_phone":"0434567003","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"-","total_unpaid_jobcost":"$700.00"},"quotes":[{"quote_no":15,"quote_prepared_on":"20-May-2026","preferred_start_date":"25-May-2026","start_location":"Gold Coast","end_location":"Brisbane","quote_cost":"$700.00","assigned_to_job":"Y","job_cost":"$700.00"},{"quote_no":25,"quote_prepared_on":"30-May-2026","preferred_start_date":"04-Jun-2026","start_location":"Brisbane","end_location":"Gold Coast","quote_cost":"$680.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":14,"customer_name":"Price","customer_business":"Garcia Frozen","customer_address":"101 Pitt Street, Sydney, 2010","customer_phone":"0467890006","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$1,300.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":16,"quote_prepared_on":"21-May-2026","preferred_start_date":"26-May-2026","start_location":"Cairns","end_location":"Townsville","quote_cost":"$1,300.00","assigned_to_job":"Y","job_cost":"$1,300.00"}]},
    {"_id":15,"customer_name":"Thomas","customer_business":"-","customer_address":"78 Hay Street, Perth, 6003","customer_phone":"0490123009","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$900.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":17,"quote_prepared_on":"22-May-2026","preferred_start_date":"27-May-2026","start_location":"Albury","end_location":"Sydney","quote_cost":"$900.00","assigned_to_job":"Y","job_cost":"$900.00"}]},
    {"_id":16,"customer_name":"Henry Lucas","customer_business":"-","customer_address":"92 Oxford Street, Sydney, 2060","customer_phone":"0412345011","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"-","total_unpaid_jobcost":"$1,050.00"},"quotes":[{"quote_no":18,"quote_prepared_on":"23-May-2026","preferred_start_date":"28-May-2026","start_location":"Mildura","end_location":"Melbourne","quote_cost":"$1,050.00","assigned_to_job":"Y","job_cost":"$1,050.00"}]},
    {"_id":17,"customer_name":"Lily Charlotte","customer_business":"-","customer_address":"18 Chapel Street, Melbourne, 3004","customer_phone":"0423456012","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$500.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":19,"quote_prepared_on":"24-May-2026","preferred_start_date":"29-May-2026","start_location":"Melbourne","end_location":"Geelong","quote_cost":"$500.00","assigned_to_job":"Y","job_cost":"$500.00"}]},
    {"_id":18,"customer_name":"Victoria Ella","customer_business":"Flintstone Store","customer_address":"94 Henley Beach Road, Adelaide, 5095","customer_phone":"0401234020","customer_stats":{"number_of_quotes":2,"number_of_jobs":1,"total_paid_jobcost":"$650.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":20,"quote_prepared_on":"25-May-2026","preferred_start_date":"30-May-2026","start_location":"Toowoomba","end_location":"Brisbane","quote_cost":"$650.00","assigned_to_job":"Y","job_cost":"$650.00"},{"quote_no":300,"quote_prepared_on":"17-May-2026","preferred_start_date":"25-May-2026","start_location":"29 Kuranda Road, Adelaide SA 5030","end_location":"9 Albatros Drive, Mount Gambier SA 5270","quote_cost":"$1,000.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":19,"customer_name":"Daniel Mason","customer_business":"-","customer_address":"83 Jetty Road, Adelaide, 5063","customer_phone":"0456789015","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"-","total_unpaid_jobcost":"$1,150.00"},"quotes":[{"quote_no":21,"quote_prepared_on":"26-May-2026","preferred_start_date":"31-May-2026","start_location":"Mackay","end_location":"Rockhampton","quote_cost":"$1,150.00","assigned_to_job":"Y","job_cost":"$1,150.00"}]},
    {"_id":20,"customer_name":"Emily Harper","customer_business":"-","customer_address":"127 Parramatta Road, Sydney, 2150","customer_phone":"0467890016","customer_stats":{"number_of_quotes":1,"number_of_jobs":1,"total_paid_jobcost":"$850.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":22,"quote_prepared_on":"27-May-2026","preferred_start_date":"01-Jun-2026","start_location":"Bunbury","end_location":"Perth","quote_cost":"$850.00","assigned_to_job":"Y","job_cost":"$850.00"}]}
]);

// List all documents you added
db.brm_customer.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.brm_customer.find(
    {
        "customer_stats.number_of_quotes": { "$gte": 2 },
        "customer_address": /.*Melbourne.*/
    },
    {
        "_id": 1,
        "customer_name": 1,
        "customer_address": 1,
        "customer_phone": 1,
        "customer_stats.number_of_quotes": 1,
        "customer_stats.number_of_jobs": 1,
        "customer_stats.total_paid_jobcost": 1,
        "customer_stats.total_unpaid_jobcost": 1
    }
);


// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i)  Add the new customer
db.brm_customer.insertOne(
    {
        "_id": 1001,
        "customer_name": "Patrick Bosse",
        "customer_business": "-",
        "customer_address": "12 King Street, Adelaide, 5000",
        "customer_phone": "0499001001",
        "customer_stats": {
            "number_of_quotes": 0,
            "number_of_jobs": 0,
            "total_paid_jobcost": "-",
            "total_unpaid_jobcost": "-"
        },
        "quotes": []
    }
);

// Show the customer details
db.brm_customer.find(
    { "_id": 1001 }
);


// (ii) Add new quote
db.brm_customer.updateOne(
    { "_id": 1001 },
    {
        "$set": {
            "customer_stats.number_of_quotes": 1,
            "customer_stats.number_of_jobs": 1,
            "customer_stats.total_paid_jobcost": "$3,200.00",
            "customer_stats.total_unpaid_jobcost": "-"
        },
        "$push": {
            "quotes": {
                "quote_no": 2002,
                "quote_prepared_on": "08-Jun-2026",
                "preferred_start_date": "12-Jun-2026",
                "start_location": "Adelaide SA",
                "end_location": "Melbourne VIC",
                "quote_cost": "$3,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,200.00"
            }
        }
    }
);

// Show the customer details
db.brm_customer.find(
    { "_id": 1001 }
);

// End of file - do not remove
