SELECT day, count(*) as total_assignments
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

SELECT c.name as cohort_name, count(s.*) as student_count
FROM cohorts as c
JOIN students as s ON c.id=s.cohort_id
GROUP BY c.name
HAVING count(s.*) >=18
ORDER BY count(s.*);

SELECT c.name as cohort, count(asb.*) as total_submissions
FROM cohorts as c
JOIN students as s ON c.id=s.cohort_id
JOIN assignment_submissions as asb ON s.id=asb.student_id
GROUP BY c.name
ORDER BY count(asb.*) DESC;

SELECT s.name as student, avg(asb.duration) as average_assignment_duration
FROM assignment_submissions as asb
JOIN students as s ON asb.student_id=s.id
WHERE s.end_date IS NULL
GROUP BY s.name
ORDER BY avg(asb.duration) desc;

SELECT s.name as student, avg(asb.duration) as average_assignment_duration, avg(a.duration) as average_estimated_duration
FROM students as s
JOIN assignment_submissions as asb ON s.id=asb.student_id
JOIN assignments as a ON asb.assignment_id=a.id
WHERE s.end_date IS NULL
GROUP BY s.name
HAVING  avg(asb.duration) <  avg(a.duration)
ORDER BY avg(asb.duration);
