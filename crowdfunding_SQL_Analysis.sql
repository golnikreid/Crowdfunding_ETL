-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
-- select * from campaign order by end_date DESC

select DISTINCT(cf_id), backers_count, outcome
from campaign 
WHERE outcome = 'live'
order by backers_count desc


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
-- select * from backers

select cf_id, count(cf_id) as backer_counts
from backers
GROUP BY cf_id
ORDER BY backer_counts desc


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select co.first_name, co.last_name, co.email, (ca.goal - ca.pledged) as remaining_goal_amount
into table email_contacts_remaining_goal_amount
from contacts co
INNER JOIN campaign ca on co.contact_id = ca.contact_id
where ca.outcome = 'live'
order by remaining_goal_amount DESC



-- Check the table
select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
select b.email, b.first_name, b.last_name, b.cf_id, ca.company_name, ca.description, ca.end_date, (ca.goal - ca.pledged) as left_of_goal
into table email_backers_remaining_goal_amount
from backers b
INNER JOIN campaign ca on b.cf_id = ca.cf_id
where ca.outcome = 'live'
order by last_name ASC


-- Check the table
select * from email_backers_remaining_goal_amount

