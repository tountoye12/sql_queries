SELECT first_name, last_name, gender  
FROM patients
where gender = 'M';

select first_name, last_name
from patients
where allergies is null;

select first_name 
from patients p
where p.first_name like 'C%';

select p.first_name, p.last_name
from patients p 
where p.weight between 100 and 120;

update patients 
set allergies = 'NKA'
where allergies is null;


-- Show first name and last name concatinated 
-- into one column to show their full name.

select concat(first_name, ' ' ,last_name) as full_name
from patients;

-- Show first name, last name, and the full province name of each patient.

-- Example: 'Ontario' instead of 'ON'

SELECT
  first_name,
  last_name,
  province_name
FROM patients
  JOIN province_names ON province_names.province_id = patients.province_id;

-- Show how many patients have a birth_date with 2010 as the birth year.

select count(*) as  total_patients from
patients
where year(birth_date) = 2010;

-- Show the first_name, last_name, and height 
-- of the patient with the greatest height.


select p.first_name, p.last_name, p.height
from patients p
where p.height = (select max(height) from patients);









