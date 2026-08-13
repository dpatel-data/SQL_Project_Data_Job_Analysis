-- QUESTION: What are the top-paying data analyst jobs?



select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
from
    job_postings_fact



-- Identify the top 10 highest-paying Data Analyst roles that are available remotely.

select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
from
    job_postings_fact
where
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere'



-- Focus on job postings with specified salaries (remove nulls).

select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
from
    job_postings_fact
where
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    salary_year_avg is not null



-- Why? Hilight the top-paying opportunities for Data Analysts...

select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
from
    job_postings_fact
where
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    salary_year_avg is not null
order by
    salary_year_avg desc
limit 10



-- Joining tables to add companies...

select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from
    job_postings_fact
left join
    company_dim on job_postings_fact.company_id = company_dim.company_id
where
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    salary_year_avg is not null
order by
    salary_year_avg desc
limit 10