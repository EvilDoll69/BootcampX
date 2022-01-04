-- SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- JOIN assignments ON assignments.id = assignment_id
-- WHERE end_date IS NULL
-- GROUP BY student
-- HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
-- ORDER BY average_assignment_duration;



-- SELECT (
--   SELECT count(assignments)
--   FROM assignments
-- )-count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

-- SELECT count(students) as total_students
-- FROM students
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts;

-- SELECT avg(total_students) as average_total
-- FROM (
--   SELECT count(students) as total_students
--   FROM students
--   JOIN cohorts ON cohorts.id = cohort_id
--   GROUP BY cohorts
-- ) as totals_tables;

SELECT assignments.name 
FROM assignments
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);
 