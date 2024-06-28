SELECT 
    skills,
    COUNT(skills) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
   -- and skills='sql'
GROUP BY
    skills
HAVING
   COUNT(skills)  > 10 and
 ROUND(AVG(salary_year_avg))>90000
ORDER BY
     demand_count DESC,
     avg_salary DESC
LIMIT 10;