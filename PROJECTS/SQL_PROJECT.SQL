SELECT	
	distinct
	job_schedule_type
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
LIMIT 10;