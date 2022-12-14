const { Pool } = require('pg');
const argv = process.argv;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const values = argv.slice(2);
pool.query(`
SELECT DISTINCT t.name as name, c.name as cohort
FROM teachers as t
JOIN assistance_requests as ar ON t.id=ar.teacher_id
JOIN students as s ON ar.student_id=s.id
JOIN cohorts as c ON s.cohort_id=c.id
WHERE c.name = $1
ORDER BY t.name;
`, values)
.then(res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.name}`);
  })
}).catch(err => console.error('query error', err.stack));
