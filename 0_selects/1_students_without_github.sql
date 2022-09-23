SELECT id, name, email, cohort_id
FROM students
where github IS null
ORDER BY cohort_id;
