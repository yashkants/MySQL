Select * From Covid_19;

# Ques.1 How Many Rows Are Present In Data?
Select Count(*) From Covid_19;

# Ques.2 Rename Columns

ALTER TABLE Covid_19
RENAME COLUMN `STATE/UTS` TO `State`,
RENAME COLUMN `Total Cases` TO `Total_Cases`,
RENAME COLUMN `Active` TO `Active_Cases`,
RENAME COLUMN `Deaths` TO `Death_Cases`,
RENAME COLUMN `Active Ratio (%)` TO `Active_Ratio`,
RENAME COLUMN `Death Ratio (%)` TO `Death_Ratio`;

# Ques.3 How Many Column Are Present In Data?
Desc Covid_19;

 --  There are 6 Columns Are Present In Covid_19 Data in which columns:-
 -- 1. State Columns --> In Which All States Are Present In This Columns
 -- 2. Total Cases ----> Total Cases Explain That How Many Total Cases Are Present In Different States
 -- 3. Active_Cases----> Active_Cases Is that how many Active_Cases In Different States
 -- 4. Deaths_Cases----> Death_Cases Is that how many Death_Cases In Different States
 -- 5. Active_Ratio----> Active_Rtio Is that how many Active_Ratio In Different States
 -- 6. Death_Ratio ----> Death_Ratio Is that how many Death_Ratio In Different States

# Ques.4 create a Recovery_cases column using the existing columns total_cases, Active_cases, and death_cases?

Alter table covid_19 add column recovery_cases int;
update covid_19 set recovery_cases=total_cases-active_cases-death_cases where recovery_cases is null;
set sql_safe_updates=0;

#Insight 1: Find Which State Has Highest Active Cases ?
select state,max(active_cases) as Highest_Active_Cases from Covid_19 group by state order by Highest_Active_Cases desc;

# According To This Insight I Have Seen That Highest Active Cases In Maharashtra-- 117869

# Insight 2: Which State Has Lowest Active Cases?
Select state,min(Active_Cases) as Lowest_Active_Cases from Covid_19 group by state order by Lowest_Active_Cases ;

# According To this Insight I Have Seen That Lowest_Active_Cases in Andaman And Nicobar Island --14

# Insight 3: Which State Has Highest Total Cases?
select state,max(total_Cases) as Highest_Total_Cases from Covid_19 group by state order by Highest_Total_Cases desc;

# According To this Insight I Have Seen That Highest_Total_Cases is also 'Maharashtra'---> '6122893'

# Insight 4: Which State Has Lowest Total Cases?
select state,min(total_Cases) as Lowest_Total_Cases from Covid_19 group by state order by Lowest_Total_Cases;

# According To this Insight I Have Seen That Lowest_Total_Cases is also 'Andaman Nicobar Island'---> '7491'

# Insight 5: Which State Has Highest Death Cases?
select state,max(death_cases) as Highest_death_cases from covid_19 group by state order by Highest_death_cases desc;

# According To this Insight I Have Seen That Highest_death_cases is 'Maharashtra'---> '123857'

# Insight 6: Which State Has Lowest Death Cases?
select state,min(death_cases) as Lowest_death_cases from covid_19 group by state order by Lowest_death_cases ;

# According To this Insight I Have Seen That Highest_death_cases is 'Dadra and Nagar Haveli and Daman and Diu'---- '4'


# Insight 7: Which State Has Highest Recovered Cases?
select state,max(recovery_cases) as highest_recovered_cases from covid_19 group by state order by highest_recovered_cases desc;

# According To this Insight I Have Seen That Highest_recovered_cases is 'Maharashtra'---- '5881167'


# Insight 8: Which State Has Lowest Recovered Cases?
select state,min(recovery_cases) as Lowest_recovered_cases from covid_19 group by state order by Lowest_recovered_cases ;

# According To this Insight I Have Seen That Lowest_recovered_cases is 'Andaman And Nicobar'---- '7349'

# Insight 9: Which State Has Highest Active Ratio?
select state,max(active_ratio) as Max_active_Ratio from covid_19 group by state order by Max_active_Ratio desc;

# According To this Insight I Have Seen That Highest_Active_Ratio is 'Mizoram'---- '17.44%'


# Insight 10: Which State Has Lowest_Active_Ratio?
select state,min(active_ratio) as min_active_Ratio from covid_19 group by state order by min_active_Ratio ;

# According To this Insight I Have Seen That Lowest_Active_Ratio is 'Madhya Pradesh'---- '0.06%'

# Insight 11: Which State Has Max_Death_Ratio?
select state,max(death_ratio) as Max_death_Ratio from covid_19 group by state order by Max_death_Ratio desc;

# According To this Insight I Have Seen That Highest_death_ratio is 'Punjab'---- '2.7%'

# Insight 12: Which State Has Min_Death_Ratio?
select state,min(death_ratio) as min_death_Ratio from covid_19 group by state order by min_death_Ratio ;

# According To this Insight I Have Seen That Lowest_Death_Ratio is 'Dadra and Nagar Haveli and Daman and Diu'---- '0.04%'
