/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst and Business Analyst positions
- Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and Business Analyst and helps identify the most financially rewarding skills to acquire or improve
*/

(
SELECT 
    skills_dim.skills,
    --job_title_short,
    ROUND(AVG(salary_year_avg) , 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
    --,job_postings_fact.job_title_short
ORDER BY
    average_salary DESC
LIMIT 50)
UNION ALL
(
SELECT 
    skills_dim.skills,
    --job_title_short,
    ROUND(AVG(salary_year_avg) , 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
    --,job_postings_fact.job_title_short
ORDER BY
    average_salary DESC
LIMIT 50)