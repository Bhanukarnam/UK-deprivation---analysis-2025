create database uk;
use uk;
select * from uk.groups;
select * from uk.individual;
select LAD24CD,LAD24NM,overall,`Rank`,income,education,health,crime,barriers,living,region,count(*)
from uk.groups
group by LAD24CD,LAD24NM,overall,`Rank`,income,education,health,crime,barriers,living,region
having count(*)>1;
select
sum(case when LAD24CD ='' then 1 else 0 end) as LAD24CD_nulls,
sum(case when LAD24NM ='' then 1 else 0 end) as LAD24NM_nulls,
sum(case when overall='' then 1 else 0 end) as overall_nulls,
sum(case when `Rank`='' then 1 else 0 end) as rank_nulls,
sum(case when income='' then 1 else 0 end) as income_nulls,
sum(case when employment='' then 1 else 0 end) as employment_nulls,
sum(case when education='' then 1 else 0 end) as education_nulls,
sum(case when health='' then 1 else 0 end ) as health_nulls,
sum(case when crime='' then 1 else 0 end) as crime_nulls,
sum(case when barriers='' then 1 else 0 end) as barrier_nulls,
sum(case when living='' then 1 else 0 end) as living_nulls,
sum(case when region='' then 1 else 0 end) as region_nulls
from uk.groups;

select
sum(case when LAD24CD is null then 1 else 0 end) as LAD24CD_nulls,
sum(case when LAD24NM is null then  1 else 0 end) as LAD24NM_nulls,
sum(case when overall is null then 1 else 0 end) as overall_nulls,
sum(case when `Rank`is null then 1 else 0 end) as rank_nulls,
sum(case when income is null then 1 else 0 end) as income_nulls,
sum(case when employment is null then 1 else 0 end) as employment_nulls,
sum(case when education is null then 1 else 0 end) as education_nulls,
sum(case when health is null then 1 else 0 end ) as health_nulls,
sum(case when crime is null then 1 else 0 end) as crime_nulls,
sum(case when barriers is null then 1 else 0 end) as barrier_nulls,
sum(case when living is null then 1 else 0 end) as living_nulls,
sum(case when region is null then 1 else 0 end) as region_nulls
from uk.groups;
set sql_safe_updates=0;
select * from uk.groups
where region='';
update uk.groups
set region= null
where region='';
select * from uk.groups
where health is null;
select * from uk.groups
where crime is null;
select * from uk.groups;
select * from uk.groups
where lad24cd is null;
update uk.groups
set lad24cd=trim(lad24cd);
select LAD24CD,count(*)from uk.groups
group by LAD24CD
having count(*)>1;
select LAD24NM,count(*)
from uk.groups
group by LAD24NM
having count(*)>1;
update uk.groups
set LAD24NM=concat(
upper(left(trim(LAD24NM),1)),
lower(substring(trim(LAD24NM),2))
);
select LAD24NM
from uk.groups;
select * from uk.groups;
select * from uk.groups
where overall<0;
select * from uk.groups
where overall>100;
update uk.groups
set overall=round(overall,2);
select * from uk.groups
where `Rank`<0;
select * from uk.groups
where `Rank` >100;
select * from uk.groups
where income<0;
select * from uk.groups
where income>100;
select * from uk.groups
where employment<0;
select * from uk.groups
where employment>130;
select * from uk.groups
where education<0;
select * from uk.groups
where education>100;
select * from uk.groups
where health<0;
select * from uk.groups
where health>100;
select * from
uk.groups
where crime>100;
select * from uk.groups
where crime<-10;
select * from uk.groups
where barriers>100;
select * from uk.groups
where barriers<-10;
select * from uk.groups
where living<0;
select * from uk.groups
where living>100;
select region,count(*) from uk.groups
group by region;
update uk.groups
set region=trim(region);
select * from uk.groups;
describe uk.groups;
alter table uk.groups
modify barriers float;
update uk.groups
set `rank`=round(`rank`),
 income=round(income,2),
 employment=round(employment,2),
 education=round(education,2),
 health=round(health,2),
 crime=round(crime,2),
 barriers=round(barriers,2),
 living=round(living,2);
 select * from uk.groups;
 select LAD24NM,count(*)
 from uk.groups
 group by LAD24NM
 having count(*)>1;
 select * from uk.region;
 alter table uk.region
 change ï»¿LAD24CD  LAD24CD text;
 select LAD24CD,LAD24NM,RGN24CD,RGN24NM,count(*) from uk.region
 group by LAD24CD,LAD24NM,RGN24CD,RGN24NM
 having count(*)>1;
 update uk.region
 set LAD24CD=trim(LAD24CD);
 update uk.region
 set LAD24NM =concat(
 upper(left(trim(LAD24NM),1)),
 lower(substring(trim(LAD24NM),2))
 );
 select * from uk.region;
 select
 sum(case when LAD24CD is null then 1 else 0 end) as LAD_nulls,
 sum(case when LAD24NM is null then 1 else 0 end) as name_nulls,
 sum(case when RGN24CD is null then 1 else 0 end) as RGN_nulls,
 sum(case when RGN24NM is null then 1 else 0 end) as RGN24NM_Nulls,
 sum(case when objectid is null then 1 else 0 end) as object_nulls
 from uk.region;
  select
 sum(case when LAD24CD ='' then 1 else 0 end) as LAD_nulls,
 sum(case when LAD24NM =''  then 1 else 0 end) as name_nulls,
 sum(case when RGN24CD ='' then 1 else 0 end) as RGN_nulls,
 sum(case when RGN24NM ='' then 1 else 0 end) as RGN24NM_Nulls,
 sum(case when objectid ='' then 1 else 0 end) as object_nulls
 from uk.region;
 select * from uk.groups;
 update uk.region
 set RGN24CD=trim(RGN24CD),
 RGN24NM=trim(RGN24NM);
 select * from uk.region
 where ObjectID <0;
 select objectid,count(*)
 from uk.region
 group by objectid
 having count(*)>1;
select * from uk.county;
alter table uk.county
change ï»¿LAD24CD LAD24CD text;
select LAD24CD,LAD24NM,CTY24CD,CTY24NM,objectID,count(*)
from uk.county
group by LAD24CD,LAD24NM,CTY24CD,CTY24NM,objectID
having count(*)>1;
select * from uk.county;
 select
 sum(case when LAD24CD is null then 1 else 0 end) as LAD_nulls,
 sum(case when LAD24NM is null then 1 else 0 end) as name_nulls,
 sum(case when CTY24CD is null then 1 else 0 end) as CTY_nulls,
 sum(case when CTY24NM is null then 1 else 0 end) as CTY24NM_Nulls,
 sum(case when objectid is null then 1 else 0 end) as object_nulls
 from uk.county;
  select
 sum(case when LAD24CD ='' then 1 else 0 end) as LAD_nulls,
 sum(case when LAD24NM ='' then 1 else 0 end) as name_nulls,
 sum(case when CTY24CD ='' then 1 else 0 end) as CTY_nulls,
 sum(case when CTY24NM ='' then 1 else 0 end) as CTY24NM_Nulls,
 sum(case when objectid ='' then 1 else 0 end) as object_nulls
 from uk.county;
update uk.county
set LAD24CD=trim(LAD24CD);
update uk.county
set LAD24NM=concat(
upper(left(trim(LAD24NM),1)),
lower(substring(trim(LAD24NM),2))
);
select LAD24NM,count(*) from uk.county
group by LAD24NM
having count(*)>1;
select LAD24NM, CTY24CD,count(*)>1
from uk.county
group by LAD24NM,CTY24CD
having count(*)>1;
update uk.county
set CTY24CD=trim(CTY24CD);
select * from uk.county;
update uk.county
set CTY24NM=trim(CTY24NM);
select objectid,count(*)
from uk.county
group by objectid
having count(*)>1;
update uk.groups
set LAD24NM=upper(LAD24NM);
update uk.region
set LAD24NM=upper(LAD24NM);
update uk.county
set LAD24NM=upper(LAD24NM);
select * from uk.groups;
select * from uk.region;
select * from uk.county;

#     BUSINESS QUESTIONS

#1. Which local authorities have the highest overall deprivation?
select LAD24NM,sum(Overall) AS highest from uk.groups
group by LAD24NM
order by sum(overall) desc limit 1;
#2. Which regions have the highest average deprivation?
select region,avg(overall) as average from uk.groups
group by region
order by avg(overall) desc limit 1;
#3. Which local authorities have the lowest deprivation?
select LAD24NM,sum(overall) as lowest_deprivation
from uk.groups
group by LAD24NM
order by sum(overall) asc limit 1;
#4. Which areas have the highest income deprivation?
select LAD24NM,sum(income) as highest
from uk.groups
group by LAD24NM
order by sum(income) desc limit 1;
#5. Which areas have the highest employment deprivation?
select LAD24NM,sum(employment) as highest
from uk.groups
group by LAD24NM order by sum(employment)desc limit 1;
#6. Which areas have the highest education deprivation?
select LAD24NM,sum(education) as highest
from uk.groups
group by LAD24NM
order by sum(education) desc limit 1;
#7. Which areas have the highest health deprivation?
select LAD24NM,
sum(health) as highest
from uk.groups
group by LAD24NM
order by sum(health) desc limit 1;
#8. Which areas have the highest crime deprivation?
select LAD24NM,sum(crime) as highest_crime
from uk.groups
group by LAD24NM
order by sum(crime) desc limit 1;
#9. Which regions have the highest average income deprivation?
select region,avg(income) as average
from uk.groups
group by region
order by avg(income) desc limit 1;
#10. Is there a relationship between overall deprivation and income deprivation?
#11. Is there a relationship between overall deprivation and employment deprivation?

#12. Which counties have the highest average deprivation?
select * from uk.county;
select * from uk.groups;
select c.cty24cd,avg(g.overall) as average
from uk.county c
join 
uk.groups g
on c.LAD24CD=g.LAD24CD
group by c.cty24cd
order by avg(g.overall) desc limit 1;
select * from uk.groups;
select * from uk.region;
select * from uk.county;
#13. Top 10 most deprived local authorities
select LAD24NM,sum(Overall) as highest from uk.groups
group by LAD24NM 
order by sum(overall) desc limit 10;
#14. Top 10 least deprived local authorities
select LAD24NM,sum(Overall) as least from uk.groups
group by LAD24NM 
order by sum(overall) asc limit 10;
#15. Which regions have the highest number of highly deprived local authorities?
select region,round(count(*)) as highest from uk.groups
group by region 
order by count(*) desc limit 10;
#16. Which region has the highest average employment deprivation?
select region,avg(employment) as average from uk.groups
group by region 
order by avg(employment) desc limit 1;
#17. Which region has the highest average education deprivation?
select region,avg(education) as average
from uk.groups
group by region
order by avg(education) desc limit 1;
#18. Which region has the highest average health deprivation?
select region,avg(health) as highest
from uk.groups
group by region
order by avg(health) desc limit 1;
#19. Which region has the highest average crime deprivation?
select region,avg(crime) as highest
from uk.groups
group by region
order by avg(crime) desc limit 1;
select * from uk.county;
select * from uk.groups;
#20. Which county has the highest number of highly deprived local authorities?
SELECT
    c.CTY24NM,
    COUNT(*) AS highly_deprived_count
FROM uk.county c
JOIN uk.groups g
    ON c.LAD24CD = g.LAD24CD
WHERE g.Overall > 0.5
GROUP BY c.CTY24NM
ORDER BY highly_deprived_count DESC
LIMIT 1;

