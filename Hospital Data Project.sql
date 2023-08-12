--------------------------------------
--Write a query that does the following:
--Lists conditions patients may have
--Count the number of patients affected by the specific condition
--Must have more than 5000 patients for the conditions
--Order in Desc
--Exclude body mass
--------------------------------------

select description,
		count(*) as count_of_Connd 
from public.conditions
where description != 'Body Mass Index 30.0-30.9, adult'
group by description 
having count(*) > 5000
order by count(*) desc

--------------------------------------
--Write a query that does the following:
--Lists number of patients 
--That live only in Boston
--------------------------------------

select count(id),
	   city
from public.patients
where city = 'Boston'
group by city 

--------------------------------------
--Write a query that does the following:
--Lists patients with chronic kidney disease 
--Using ICD9 Code ('585.1', '585.2','585.3','585.4')
--Order in ASC 
--------------------------------------

select *
from public.conditions
where code in ('585.1', '585.2','585.3','585.4')
order by code ASC

--------------------------------------
--Write a query that does the following:
--Lists out number of patients per city in desc order
--Doesnt include Boston (Case Sen.)
--Must have at least 100 patients in that city
--------------------------------------
select count(id) Number_of_Patients,
	   city
from public.patients
where city != 'Boston'
group by city
having count(id) >= 100
order by count(id) DESC
