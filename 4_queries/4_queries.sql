SELECT count(ar.*) AS total_assistances, t.name AS name
FROM assistance_requests as ar
JOIN teachers as t ON ar.teacher_id=t.id
WHERE t.name='Waylon Boehm'
GROUP BY t.name;

SELECT count(ar.*) AS total_requests, s.name AS name
FROM assistance_requests as ar
JOIN students AS s ON ar.student_id=s.id
WHERE s.name='Elliot Dickinson'
GROUP BY s.name;

SELECT t.name as teacher, s.name as student, a.name as assignment, (ar.completed_at - ar.started_at) as duration
FROM assistance_requests as ar
JOIN teachers as t ON ar.teacher_id=t.id
JOIN students as s ON ar.student_id=s.id
JOIN assignments as a ON ar.assignment_id=a.id
ORDER BY duration;

SELECT c.name as name, avg(ar.completed_at - ar.started_at) as average_assistance_request_duration
FROM assistance_requests as ar
JOIN students as s ON ar.student_id= s.id
JOIN cohorts as c ON s.cohort_id=c.id
GROUP BY c.name
ORDER BY average_assistance_request_duration desc LIMIT 1;

SELECT c.name, sum(ar.completed_at - ar.started_at) as total_duration
FROM assistance_requests as ar
JOIN students as s ON ar.student_id=s.id
JOIN cohorts as c ON s.cohort_id=c.id
GROUP BY c.name
ORDER BY total_duration;

SELECT avg(total_duration) as average_total_duration
FROM(
  SELECT sum(ar.completed_at - ar.started_at) as total_duration
  FROM assistance_requests as ar
  JOIN students as s ON ar.student_id=s.id
  JOIN cohorts as c ON s.cohort_id=c.id
  GROUP BY c.name
) as total_durations;

SELECT day, count(*) as number_of_assignments, sum(duration) as duration
FROM assignments
GROUP BY day
ORDER BY day;

SELECT DISTINCT t.name as teacher, c.name as cohort
FROM teachers as t
JOIN assistance_requests as ar ON t.id=ar.teacher_id
JOIN students as s ON ar.student_id=s.id
JOIN cohorts as c ON s.cohort_id=c.id
WHERE c.name='JUL02'
ORDER BY t.name;

SELECT t.name as teacher, c.name as cohort, count(ar.*) as total_assistances
FROM teachers as t
JOIN assistance_requests as ar ON t.id=ar.teacher_id
JOIN students as s ON ar.student_id=s.id
JOIN cohorts as c ON s.cohort_id=c.id
WHERE c.name='JUL02'
GROUP BY t.name, c.name
ORDER BY t.name;
