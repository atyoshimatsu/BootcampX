SELECT sum(a.duration) as total_duration
FROM assignment_submissions as a
INNER JOIN students as s on a.student_id=s.id
WHERE s.name='Ibrahim Schimmel';

SELECT sum(a.duration) as total_duration
FROM assignment_submissions as a
INNER JOIN students as s on a.student_id=s.id
INNER JOIN cohorts as c on s.cohort_id=c.id
WHERE c.name='FEB12';
