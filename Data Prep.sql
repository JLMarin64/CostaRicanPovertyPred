
drop table dbo.[data_attributes]

select *
from costarica.dbo.train a


select *
from costarica.dbo.[data_attributes]
where level = 'Member Level'


select *
from costarica.dbo.[data_attributes]
where level = 'Household Level'

select *
from costarica.dbo.[data_attributes] a
where a.[Definition] like '%head%'



update [data_attributes] set  [level] = 'Member Level'
where [variable name] = 'agesq'


drop table #train_heads
drop table #test_heads

select
idhogar,
parentesco1,
Id,
hhsize,
v2a1,
hacdor,
rooms,
hacapo,
v14a,
refrig,
v18q1,
r4h1,
r4h2,
r4h3,
r4m1,
r4m2,
r4m3,
r4t1,
r4t2,
r4t3,
tamhog,
tamviv,
paredblolad,
paredzocalo,
paredpreb,
pareddes,
paredmad,
paredzinc,
paredfibras,
paredother,
pisomoscer,
pisocemento,
pisoother,
pisonatur,
pisonotiene,
pisomadera,
techozinc,
techoentrepiso,
techocane,
techootro,
cielorazo,
abastaguadentro,
abastaguafuera,
abastaguano,
[public],
planpri,
noelec,
coopele,
sanitario1,
sanitario2,
sanitario3,
sanitario5,
sanitario6,
energcocinar1,
energcocinar2,
energcocinar3,
energcocinar4,
elimbasu1,
elimbasu2,
elimbasu3,
elimbasu4,
elimbasu5,
elimbasu6,
epared1,
epared2,
epared3,
etecho1,
etecho2,
etecho3,
eviv1,
eviv2,
eviv3,
hogar_nin,
hogar_adul,
hogar_mayor,
hogar_total,
dependency,
edjefe,
edjefa,
meaneduc,
bedrooms,
overcrowding,
tipovivi1,
tipovivi2,
tipovivi3,
tipovivi4,
tipovivi5,
computer,
television,
qmobilephone,
lugar1,
lugar2,
lugar3,
lugar4,
lugar5,
lugar6,
area1,
area2,
SQBescolari,
SQBhogar_total,
SQBedjefe,
SQBhogar_nin,
SQBovercrowding,
SQBdependency,
SQBmeaned into #train_heads
from train
where parentesco1 = '1'



select
idhogar,
parentesco1,
Id,
hhsize,
v2a1,
hacdor,
rooms,
hacapo,
v14a,
refrig,
v18q1,
r4h1,
r4h2,
r4h3,
r4m1,
r4m2,
r4m3,
r4t1,
r4t2,
r4t3,
tamhog,
tamviv,
paredblolad,
paredzocalo,
paredpreb,
pareddes,
paredmad,
paredzinc,
paredfibras,
paredother,
pisomoscer,
pisocemento,
pisoother,
pisonatur,
pisonotiene,
pisomadera,
techozinc,
techoentrepiso,
techocane,
techootro,
cielorazo,
abastaguadentro,
abastaguafuera,
abastaguano,
[public],
planpri,
noelec,
coopele,
sanitario1,
sanitario2,
sanitario3,
sanitario5,
sanitario6,
energcocinar1,
energcocinar2,
energcocinar3,
energcocinar4,
elimbasu1,
elimbasu2,
elimbasu3,
elimbasu4,
elimbasu5,
elimbasu6,
epared1,
epared2,
epared3,
etecho1,
etecho2,
etecho3,
eviv1,
eviv2,
eviv3,
hogar_nin,
hogar_adul,
hogar_mayor,
hogar_total,
dependency,
edjefe,
edjefa,
meaneduc,
bedrooms,
overcrowding,
tipovivi1,
tipovivi2,
tipovivi3,
tipovivi4,
tipovivi5,
computer,
television,
qmobilephone,
lugar1,
lugar2,
lugar3,
lugar4,
lugar5,
lugar6,
area1,
area2,
SQBescolari,
SQBhogar_total,
SQBedjefe,
SQBhogar_nin,
SQBovercrowding,
SQBdependency,
SQBmeaned into #test_heads
from test
where parentesco1 = '1'

--Check
select idhogar, count(idhogar)
from #train_heads
group by idhogar
having count(idhogar) > 1


select distinct hhsize
from train


select 
idhogar,
sum(cast(v18q as int)) 'JM_Sum_of_Tablets',
sum(cast(escolari as int)) 'Total Sum Years of Schooling',
sum(case when escolari < 5 then 1 else 0 end) as 'JM_People_Educ_LT5',
sum(case when escolari < 10 then 1 else 0 end) as 'JM_People_Educ_LT10',
sum(case when escolari < 15 then 1 else 0 end) as 'JM_People_Educ_LT15',
sum(case when escolari < 20 then 1 else 0 end) as 'JM_People_Educ_LT20',
sum(case when escolari < 25 then 1 else 0 end) as 'JM_People_Educ_LT25',
sum(case when rez_esc = 1 then 1 else 0 end) as 'JM_1YrBehindSchool',
sum(case when rez_esc = 2 then 1 else 0 end) as 'JM_2YrBehindSchool',
sum(case when rez_esc = 3 then 1 else 0 end) as 'JM_3YrBehindSchool',
sum(case when rez_esc = 4 then 1 else 0 end) as 'JM_4YrBehindSchool',
sum(case when rez_esc = 5 then 1 else 0 end) as 'JM_5YrBehindSchool',
sum(cast(dis as int)) as 'JM_Sum_of_Disabled',
sum(cast(male as int)) as 'JM_Sum_Of_Males',
sum(cast(female as int)) as 'JM_Sum_Of_Females',
sum(cast(estadocivil1 as int)) as  'JM_estadocivil1',
sum(cast(estadocivil2 as int)) as  'JM_estadocivil2',
sum(cast(estadocivil3 as int)) as  'JM_estadocivil3',
sum(cast(estadocivil4 as int)) as  'JM_estadocivil4',
sum(cast(estadocivil5 as int)) as  'JM_estadocivil5',
sum(cast(estadocivil6 as int)) as  'JM_estadocivil6',
sum(cast(estadocivil7 as int)) as  'JM_estadocivil7',
sum(cast(parentesco1 as int)) as  'JM_parentesco1',
sum(cast(parentesco2 as int)) as  'JM_parentesco2',
sum(cast(parentesco3 as int)) as  'JM_parentesco3',
sum(cast(parentesco4 as int)) as  'JM_parentesco4',
sum(cast(parentesco5 as int)) as  'JM_parentesco5',
sum(cast(parentesco6 as int)) as  'JM_parentesco6',
sum(cast(parentesco7 as int)) as  'JM_parentesco7',
sum(cast(parentesco8 as int)) as  'JM_parentesco8',
sum(cast(parentesco9 as int)) as  'JM_parentesco9',
sum(cast(parentesco10 as int)) as  'JM_parentesco10',
sum(cast(parentesco11 as int)) as  'JM_parentesco11',
sum(cast(parentesco12 as int)) as  'JM_parentesco12',
sum(cast(instlevel1 as int)) as  'JM_instlevel1',
sum(cast(instlevel2 as int)) as  'JM_instlevel2',
sum(cast(instlevel3 as int)) as  'JM_instlevel3',
sum(cast(instlevel4 as int)) as  'JM_instlevel4',
sum(cast(instlevel5 as int)) as  'JM_instlevel5',
sum(cast(instlevel6 as int)) as  'JM_instlevel6',
sum(cast(instlevel7 as int)) as  'JM_instlevel7',
sum(cast(instlevel8 as int)) as  'JM_instlevel8',
sum(cast(instlevel9 as int)) as  'JM_instlevel9',
sum(cast(mobilephone as int)) as  'JM_mobilephone' into train_member_agg
from train
group by idhogar




select 
idhogar,
sum(cast(v18q as int)) 'JM_Sum_of_Tablets',
sum(cast(escolari as int)) 'Total Sum Years of Schooling',
sum(case when escolari < 5 then 1 else 0 end) as 'JM_People_Educ_LT5',
sum(case when escolari < 10 then 1 else 0 end) as 'JM_People_Educ_LT10',
sum(case when escolari < 15 then 1 else 0 end) as 'JM_People_Educ_LT15',
sum(case when escolari < 20 then 1 else 0 end) as 'JM_People_Educ_LT20',
sum(case when escolari < 25 then 1 else 0 end) as 'JM_People_Educ_LT25',
sum(case when rez_esc = 1 then 1 else 0 end) as 'JM_1YrBehindSchool',
sum(case when rez_esc = 2 then 1 else 0 end) as 'JM_2YrBehindSchool',
sum(case when rez_esc = 3 then 1 else 0 end) as 'JM_3YrBehindSchool',
sum(case when rez_esc = 4 then 1 else 0 end) as 'JM_4YrBehindSchool',
sum(case when rez_esc = 5 then 1 else 0 end) as 'JM_5YrBehindSchool',
sum(cast(dis as int)) as 'JM_Sum_of_Disabled',
sum(cast(male as int)) as 'JM_Sum_Of_Males',
sum(cast(female as int)) as 'JM_Sum_Of_Females',
sum(cast(estadocivil1 as int)) as  'JM_estadocivil1',
sum(cast(estadocivil2 as int)) as  'JM_estadocivil2',
sum(cast(estadocivil3 as int)) as  'JM_estadocivil3',
sum(cast(estadocivil4 as int)) as  'JM_estadocivil4',
sum(cast(estadocivil5 as int)) as  'JM_estadocivil5',
sum(cast(estadocivil6 as int)) as  'JM_estadocivil6',
sum(cast(estadocivil7 as int)) as  'JM_estadocivil7',
sum(cast(parentesco1 as int)) as  'JM_parentesco1',
sum(cast(parentesco2 as int)) as  'JM_parentesco2',
sum(cast(parentesco3 as int)) as  'JM_parentesco3',
sum(cast(parentesco4 as int)) as  'JM_parentesco4',
sum(cast(parentesco5 as int)) as  'JM_parentesco5',
sum(cast(parentesco6 as int)) as  'JM_parentesco6',
sum(cast(parentesco7 as int)) as  'JM_parentesco7',
sum(cast(parentesco8 as int)) as  'JM_parentesco8',
sum(cast(parentesco9 as int)) as  'JM_parentesco9',
sum(cast(parentesco10 as int)) as  'JM_parentesco10',
sum(cast(parentesco11 as int)) as  'JM_parentesco11',
sum(cast(parentesco12 as int)) as  'JM_parentesco12',
sum(cast(instlevel1 as int)) as  'JM_instlevel1',
sum(cast(instlevel2 as int)) as  'JM_instlevel2',
sum(cast(instlevel3 as int)) as  'JM_instlevel3',
sum(cast(instlevel4 as int)) as  'JM_instlevel4',
sum(cast(instlevel5 as int)) as  'JM_instlevel5',
sum(cast(instlevel6 as int)) as  'JM_instlevel6',
sum(cast(instlevel7 as int)) as  'JM_instlevel7',
sum(cast(instlevel8 as int)) as  'JM_instlevel8',
sum(cast(instlevel9 as int)) as  'JM_instlevel9',
sum(cast(mobilephone as int)) as  'JM_mobilephone' into test_member_agg
from test
group by idhogar


select a.*,
b.JM_1YrBehindSchool,
b.JM_2YrBehindSchool,
b.JM_3YrBehindSchool,
b.JM_4YrBehindSchool,
b.JM_5YrBehindSchool,
b.JM_estadocivil1,
b.JM_estadocivil2,
b.JM_estadocivil3,
b.JM_estadocivil4,
b.JM_estadocivil5,
b.JM_estadocivil6,
b.JM_estadocivil7,
b.JM_instlevel1,
b.JM_instlevel2,
b.JM_instlevel3,
b.JM_instlevel4,
b.JM_instlevel5,
b.JM_instlevel6,
b.JM_instlevel7,
b.JM_instlevel8,
b.JM_instlevel9,
b.JM_mobilephone,
b.JM_parentesco1,
b.JM_parentesco10,
b.JM_parentesco11,
b.JM_parentesco12,
b.JM_parentesco2,
b.JM_parentesco3,
b.JM_parentesco4,
b.JM_parentesco5,
b.JM_parentesco6,
b.JM_parentesco7,
b.JM_parentesco8,
b.JM_parentesco9,
b.JM_People_Educ_LT10,
b.JM_People_Educ_LT15,
b.JM_People_Educ_LT20,
b.JM_People_Educ_LT25,
b.JM_People_Educ_LT5,
b.JM_Sum_of_Disabled,
b.JM_Sum_Of_Females,
b.JM_Sum_Of_Males,
b.JM_Sum_of_Tablets
 into #train_model_set
from #train_heads a
left join #train_member_agg b on a.idhogar = b.idhogar


select a.*, 
b.JM_1YrBehindSchool,
b.JM_2YrBehindSchool,
b.JM_3YrBehindSchool,
b.JM_4YrBehindSchool,
b.JM_5YrBehindSchool,
b.JM_estadocivil1,
b.JM_estadocivil2,
b.JM_estadocivil3,
b.JM_estadocivil4,
b.JM_estadocivil5,
b.JM_estadocivil6,
b.JM_estadocivil7,
b.JM_instlevel1,
b.JM_instlevel2,
b.JM_instlevel3,
b.JM_instlevel4,
b.JM_instlevel5,
b.JM_instlevel6,
b.JM_instlevel7,
b.JM_instlevel8,
b.JM_instlevel9,
b.JM_mobilephone,
b.JM_parentesco1,
b.JM_parentesco10,
b.JM_parentesco11,
b.JM_parentesco12,
b.JM_parentesco2,
b.JM_parentesco3,
b.JM_parentesco4,
b.JM_parentesco5,
b.JM_parentesco6,
b.JM_parentesco7,
b.JM_parentesco8,
b.JM_parentesco9,
b.JM_People_Educ_LT10,
b.JM_People_Educ_LT15,
b.JM_People_Educ_LT20,
b.JM_People_Educ_LT25,
b.JM_People_Educ_LT5,
b.JM_Sum_of_Disabled,
b.JM_Sum_Of_Females,
b.JM_Sum_Of_Males,
b.JM_Sum_of_Tablets
 into #test_model_set
from #test_heads a
left join #test_member_agg b on a.idhogar = b.idhogar


select * into train_model_set
from #train_model_set

select * into test_model_set
from #test_model_set


select *
from #test_heads

select idhogar, sum(cast(parentesco1 as int)) as 'sum'
from test
group by idhogar
having sum(cast(parentesco1 as int)) < 1



select *
from train_model_set

select *
from test_model_set

select *
from dbo.[data_attributes]

update train_model_set set v2a1 = '0'
where (tipovivi1 = '1')

update test_model_set set v2a1 = '0'
where (tipovivi1 = '1')




select count(*)
from train_model_set
where v2a1 = ''

select count(*)
from test_model_set
where v2a1 = ''



select *
from train_model_set

select *
from test_model_set




















