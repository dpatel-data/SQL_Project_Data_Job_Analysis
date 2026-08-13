-- QUESTION: What are the skills required for these top-paying roles?



-- Turning this to a CTE.

with top_paying_jobs as (
    select
        job_id,
        job_title,
        salary_year_avg,
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
)

select *
from top_paying_jobs



-- Using Inner Join because we only want skills associated with the salary from first table.

with top_paying_jobs as (
    select
        job_id,
        job_title,
        salary_year_avg,
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
)

select *
from top_paying_jobs
inner join
    skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by
    top_paying_jobs.salary_year_avg desc



/*
========================================================
DATA ANALYST SKILLS BREAKDOWN
Based on 8 unique job postings
Total skill records: 66
========================================================

SKILL                    POSTINGS       PERCENTAGE
--------------------------------------------------------
SQL                      8 / 8          100%
Python                   7 / 8           87.5%
Tableau                  6 / 8           75%
R                        4 / 8           50%
Excel                    3 / 8           37.5%
Pandas                   3 / 8           37.5%
Snowflake                3 / 8           37.5%
Azure                    2 / 8           25%
AWS                      2 / 8           25%
Oracle                   2 / 8           25%
Power BI                 2 / 8           25%
Go                       2 / 8           25%
Jira                     2 / 8           25%
Confluence               2 / 8           25%
Bitbucket                2 / 8           25%
GitLab                   2 / 8           25%
NumPy                    2 / 8           25%

========================================================
KEY INSIGHTS
========================================================

1. SQL is the most important skill.
   - Appears in 100% of the analyzed postings.
   - SQL is essentially a core requirement for these roles.

2. Python is highly valuable.
   - Appears in 87.5% of postings.
   - Python is commonly paired with data-analysis libraries
     such as Pandas and NumPy.

3. Tableau is the leading BI/visualization tool.
   - Appears in 75% of postings.
   - Power BI appears in 25% of postings.

4. R is still relevant.
   - Appears in 50% of postings.
   - However, Python is significantly more common.

5. Excel remains useful.
   - Appears in 37.5% of postings.
   - It is still an important traditional analyst skill.

6. Modern data platforms are present.
   - Snowflake, AWS, Azure, Databricks, Hadoop and PySpark
     appear across the postings.
   - Higher-paying analyst roles can require cloud/data
     warehouse knowledge.

========================================================
OVERALL SKILL PRIORITY
========================================================

1. SQL             -> Essential
2. Python          -> Very High Priority
3. Tableau         -> High Priority
4. Excel           -> Important
5. R               -> Useful
6. Pandas / NumPy  -> Important for Python-based analysis
7. Snowflake       -> Valuable specialization
8. AWS / Azure     -> Valuable cloud skills
9. Other tools     -> Role/company dependent

========================================================
MAIN TAKEAWAY
========================================================

The strongest skill combination in these postings is:

SQL + Python + BI/Visualization

The data suggests that higher-paying Data Analyst roles tend
to become more technical, combining traditional analytics
with programming, visualization, cloud platforms and
modern data warehouses.

NOTE:
The original dataset was labeled "Top 10", but only 8 unique
job postings were present in the analyzed data.
========================================================

results:
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 74,
    "skill_id (1)": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 75,
    "skill_id (1)": 75,
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 76,
    "skill_id (1)": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 93,
    "skill_id (1)": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 95,
    "skill_id (1)": 95,
    "skills": "pyspark",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 102,
    "skill_id (1)": 102,
    "skills": "jupyter",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 183,
    "skill_id (1)": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_id (1)": 552322,
    "skill_id": 196,
    "skill_id (1)": 196,
    "skills": "powerpoint",
    "type": "analyst_tools"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "job_id (1)": 99305,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "job_id (1)": 99305,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "job_id (1)": 99305,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "job_id (1)": 99305,
    "skill_id": 97,
    "skill_id (1)": 97,
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "job_id (1)": 99305,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "job_id (1)": 1021647,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "job_id (1)": 1021647,
    "skill_id": 23,
    "skill_id (1)": 23,
    "skills": "crystal",
    "type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "job_id (1)": 1021647,
    "skill_id": 79,
    "skill_id (1)": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "job_id (1)": 1021647,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "job_id (1)": 1021647,
    "skill_id": 215,
    "skill_id (1)": 215,
    "skills": "flow",
    "type": "other"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 8,
    "skill_id (1)": 8,
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 80,
    "skill_id (1)": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 93,
    "skill_id (1)": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 94,
    "skill_id (1)": 94,
    "skills": "numpy",
    "type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 168310,
    "skill_id": 220,
    "skill_id (1)": 220,
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 74,
    "skill_id (1)": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 76,
    "skill_id (1)": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 79,
    "skill_id (1)": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 80,
    "skill_id (1)": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 183,
    "skill_id (1)": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 189,
    "skill_id (1)": 189,
    "skills": "sap",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 211,
    "skill_id (1)": 211,
    "skills": "jenkins",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 218,
    "skill_id (1)": 218,
    "skills": "bitbucket",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 219,
    "skill_id (1)": 219,
    "skills": "atlassian",
    "type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 233,
    "skill_id (1)": 233,
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_id (1)": 731368,
    "skill_id": 234,
    "skill_id (1)": 234,
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 210,
    "skill_id (1)": 210,
    "skills": "git",
    "type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 218,
    "skill_id (1)": 218,
    "skills": "bitbucket",
    "type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 219,
    "skill_id (1)": 219,
    "skills": "atlassian",
    "type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 233,
    "skill_id (1)": 233,
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_id (1)": 310660,
    "skill_id": 234,
    "skill_id (1)": 234,
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 8,
    "skill_id (1)": 8,
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 80,
    "skill_id (1)": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 93,
    "skill_id (1)": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 94,
    "skill_id (1)": 94,
    "skills": "numpy",
    "type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_id (1)": 1749593,
    "skill_id": 220,
    "skill_id (1)": 220,
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 387860,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 387860,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 387860,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming"
  }
]
*/