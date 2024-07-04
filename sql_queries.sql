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

/*
Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000
*/

select * 
from patients 
 where patient_id in (1,45,534,879,1000);

 /*
Show the total number of admissions
*/

select count(*) total from
admissions;

/*
Show all the columns from admissions where the patient 
was admitted and discharged on the same day.
*/

select * 
from admissions a 
where a.admission_date = a.discharge_date;


/*
Show the patient id and the total number 
of admissions for patient_id 579.
*/

select patient_id, count(patient_id) as total_admissions
from admissions
where patient_id = 579;

/*
Based on the cities that our patients live in, 
show unique cities that are in province_id 'NS'?
*/

select distinct city 
from
 patients
 where province_id = 'NS';


/*
Write a query to find the first_name, last_name and 
birth_ate of patients who has 
height greater than 160 and weight greater than 70
*/

select p.first_name, p.last_name, p.birth_date 
from
patients p
where p.height > 160 and p.weight > 70;

/*
Write a query to find the first_name, last_name and 
birth_ate of patients who has 
height greater than 160 and weight greater than 70
*/

select p.first_name, p.last_name, p.allergies 
from
patients p
where p.allergies is not null and city = 'Hamilton';
	

/*
Show unique birth years from patients and order them by ascending.
*/

select distinct year(p.birth_date) as birt
from
patients p
order by birt;

/*
Show unique birth years from patients and order them by ascending.
*/

select  p.first_name
from
patients p

group by p.first_name

having count(p.first_name) = 1;

/*
Show patient_id and first_name from patients 
where their first_name start 
and ends with 's' and is at least 6 characters long.

*/

select  p.patient_id, p.first_name
from
patients p
where p.first_name like 's%s' 
and len(p.first_name) >= 6
;









