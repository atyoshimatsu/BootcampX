const { Pool } = require('pg');
const argv = process.argv;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];
pool.query(`
SELECT s.id AS id, s.name AS name, c.name AS cohort_name
FROM students AS s
JOIN cohorts AS c ON s.cohort_id = c.id
WHERE c.name LIKE $1
LIMIT $2;
`, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
}).catch(err => console.error('query error', err.stack));
