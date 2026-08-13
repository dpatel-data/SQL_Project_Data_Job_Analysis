-- QUESTION: What are the most in-demand skills for Data Analysis?

-- Join Job Postings to inner join table similar to query2.
-- Identify the top 5 in-demand skils for a Data Analyst.
-- Focus on all job postings.
-- Why? Retrieves the top 5 skills with the highest demand in the job market.

select *
from job_postings_fact
inner join
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
limit 5;



select
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner join
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst'
group by skills
order by demand_count desc
limit 5;

/*
results:
[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/



-- comparing results with remote jobs...

select
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner join
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst' and
    job_work_from_home = TRUE
group by skills
order by demand_count desc
limit 5;

/*
results:
[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/