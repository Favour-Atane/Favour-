USE Bank;
select * from bank_details;

# Education Count
Select education, count(*) as total_education from bank_details group by 1;

# Those that have thier loan approved
Select loan, count(*) AS total_loan from bank_details group by 1;

# Job count
Select job, count(*) AS total_jobs from bank_details group by 1;