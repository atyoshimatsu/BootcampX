const { Pool } = require('pg');
const argv = process.argv;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const [cohortName, limit] = argv.slice(2);
const whereClause = !!cohortName ? `WHERE c.name like '%${cohortName}%'` : '';
pool.query(`
SELECT s.id AS id, s.name AS name, c.name AS cohort_name
FROM students AS s
JOIN cohorts AS c ON s.cohort_id = c.id
${whereClause}
LIMIT ${limit || 5};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
}).catch(err => console.error('query error', err.stack));
