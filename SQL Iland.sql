-- https://sql-island.informatik.uni-kl.de/ 

-- 1) It seems there are a few people living in these villages. How can I see a list of all inhabitants?

select *
from inhabitant 

-- 2) People who are fridndly in the island.

select *
from inhabitant 
where state = "friendly" 

-- 3) There is no way around getting a sword for myself. I will now try to find a friendly weaponsmith to forge me one. 

select *
from inhabitant 
where state = "friendly" 
and job = "weaponsmith"

-- 4) Oh, that does not look good. Maybe other friendly smiths can help you out, e.g. a blacksmith.

select *
from inhabitant 
where state = "friendly" 
and job like "%smith"

-- 5) No need to call me stranger! What's my personid?

select personid
from inhabitant 
where name = "Stranger"

-- 6) How much gold do you have? 

select gold
from inhabitant 
where name = "Stranger"

-- 7) Unowned items list 

select *
from item  
where owner is null

-- 8) Do you know a trick how to collect all the ownerless items?

update item 
set owner = 20 
where owner is null

-- 9) Now list all of the items I have!

select * 
from item 
where owner = 20

-- 10) Find inhabitant who is a dealer or a merchant.

select * 
from inhabitant 
where state = "friendly"
and job is "dealer" 
or job is "merchant"

--  11) I'd like to get the ring and the teapot. The rest is nothing but scrap. Please give me the two items. My personid is 15.

update item 
set owner  = 15 
where item = "ring"
or item = "teapot"

-- 12) Seems like I do have to work after all. Maybe it's not a bad idea to change my name from Stranger to my real name before I will apply for a job.

update inhabitant 
set name = "Paul"
where personid = 20

-- 13) Since baking is one of my hobbies, why not find a baker who I can work for?

select * 
from inhabitant 
where job is "baker"
order by gold desc

-- 14) Is there a pilot on this island by any chance? He could fly me home.

select * 
from inhabitant 
where job is "pilot"


