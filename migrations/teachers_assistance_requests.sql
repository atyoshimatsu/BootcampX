CREATE TABLE teachers (
  id serial PRIMARY KEY NOT NULL,
  name varchar(255),
  is_active boolean DEFAULT TRUE,
  start_date date,
  end_date date
);

CREATE TABLE assistance_requests (
  id serial PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback text,
  teacher_feedback text
);
