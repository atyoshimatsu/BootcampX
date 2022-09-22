CREATE TABLE cohorts (
  id serial PRIMARY KEY not null,
  name varchar(255) not null,
  start_date date,
  end_date date
);

CREATE TABLE students (
  id serial PRIMARY KEY not null,
  name varchar(255) not null,
  email varchar(255),
  phone varchar(12),
  github varchar(255),
  start_date date,
  end_date date,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);
