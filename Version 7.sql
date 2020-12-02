create table team (
	Team_Name varchar(100) unique, 
    #Team_Match_ID bigint,
    #Current_Coach bigint,
    Home_Field bigint,
		primary key (Team_Name));

insert into team (Team_Name) values ('Stringtough');
insert into team (Team_Name) values ('Bitchip');
insert into team (Team_Name) values ('Prodder' );
insert into team (Team_Name) values ('Konklab');

create table matches (
	Match_ID bigint,
    Home_Team varchar(100),
    Away_Team varchar(100),
    Home_Score int,
    Away_Score int,
    Winner varchar(100),
    Match_Date date,
    Field_ID bigint,
		primary key (Match_ID),
        constraint match_Home_Team_fk foreign key (Home_Team) references team (Team_Name),
		constraint match_Away_Team_fk foreign key (Away_Team) references team (Team_Name));
        
insert into matches (Match_ID, Home_Team, Away_Team, Home_Score, Away_Score, Winner, Match_Date) values ('3597272282', 'Stringtough', 'Bitchip', NULL, NULL, NULL, '2021-10-23');
insert into matches (Match_ID, Home_Team, Away_Team, Home_Score, Away_Score, Winner, Match_Date) values ('6475019283', 'Prodder', 'Konklab', 3, 2, 'Prodder', '2019-05-28');
insert into matches (Match_ID, Home_Team, Away_Team, Home_Score, Away_Score, Winner, Match_Date) values ('6752579911', 'Bitchip', 'Prodder', 10, 1, 'Bitchip', '2014-11-20');
insert into matches (Match_ID, Home_Team, Away_Team, Home_Score, Away_Score, Winner, Match_Date) values ('4167850036', 'Konklab', 'Stringtough', 3, 8, 'Stringtough', '2018-06-12');
insert into matches (Match_ID, Home_Team, Away_Team, Home_Score, Away_Score, Winner, Match_Date) values ('5187254066', 'Konklab', 'Bitchip', NULL, NULL, NULL, '2021-08-08');

  
create table team_match (
	Team_Match_ID bigint,
    Team_Name varchar(100),
    Match_ID bigint,
    Match_Winner varchar(100),
    Match_Loser varchar(100),
		primary key (Team_Match_ID),
        constraint TM_Team_Name_fk foreign key (Team_Name) references team (Team_Name),
        constraint TM_Match_ID_fk foreign key (Match_ID) references matches (Match_ID));

insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('7067780071', 'Stringtough', '3597272282', 'Bitchip', 'Stringtough');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('1841962708', 'Stringtough', '4167850036', 'Stringtough', 'Konklab');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('2963933835', 'Prodder', '6475019283', 'Prodder', 'Konklab');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('6396586924', 'Prodder', '6752579911', 'Bitchip', 'Prodder');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('7878759294', 'Bitchip', '3597272282', 'Bitchip', 'Stringtough');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('4565258900', 'Bitchip', '6752579911', 'Bitchip', 'Prodder');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('1751962377', 'Konklab', '6475019283', 'Prodder', 'Konklab');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('7940245724', 'Konklab', '4167850036', 'Stringtough', 'Konklab');
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('8950148328', 'Konklab', '5187254066', NULL, NULL);
insert into team_match (Team_Match_ID, Team_Name, Match_ID, Match_Winner, Match_Loser) values ('4960848428', 'Bitchip', '5187254066', NULL, NULL);

create table coach (
	Coach_ID bigint,
    Coach_Name varchar(100),
    Coach_Age bigint,
    Current_Team varchar(100),
    #Coach_Team_ID bigint,
		primary key (Coach_ID),
        constraint Coach_Current_Team_fk foreign key (Current_Team) references team (Team_Name));
# don't know why this foreign key won't work, but this is needed
#alter table team add constraint Team_Current_Coach_fk foreign key (Current_Coach_ID) references coach (Coach_ID);

insert into coach (Coach_ID, Coach_Name, Coach_Age, Current_Team) values ('8308466907', 'Brigitta Ferrulli', 76, 'Stringtough');
insert into coach (Coach_ID, Coach_Name, Coach_Age, Current_Team) values ('1973492601', 'Noll Hankard', 21, 'Prodder');
insert into coach (Coach_ID, Coach_Name, Coach_Age, Current_Team) values ('1782895620', 'Hort Salvadori', 80, 'Bitchip');
insert into coach (Coach_ID, Coach_Name, Coach_Age, Current_Team) values ('4802668422', 'Olympia Treasure', 83, 'Konklab');

create table coaching_history (
	Coach_Team_ID bigint,
    Coach_ID bigint,
    Team_Name varchar(100),
		primary key (Coach_Team_ID),
        constraint CH_Coach_ID_fk foreign key (Coach_ID) references coach (Coach_ID),
        constraint CH_Team_Name_fk foreign key (Team_Name) references team (Team_Name));
#alter table coach add constraint Coach_Coach_Team_ID_fk foreign key (Coach_Team_ID) references coaching_history (Coach_Team_ID);

insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('5257175681', '8308466907', 'Stringtough');
insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('8168411455', '8308466907', 'Prodder');
insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('6389249837', '1973492601', 'Prodder');
insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('5297329345', '1973492601', 'Konklab');
insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('4589214788', '4802668422', 'Konklab');
insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('8888777878', '4802668422', 'Stringtough');
insert into coaching_history (Coach_Team_ID, Coach_ID, Team_Name) values ('1234567897', '1782895620', 'Bitchip');


create table player (
	Player_ID bigint,
    Player_Name varchar(100),
    Player_Age int,
    Current_Team varchar(100),
		primary key (Player_ID),
        constraint player_Current_Team_fk foreign key (Current_Team) references team (Team_Name));

insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('7635949004', 'Myriam Penna', 35, 'Konklab');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('3638831760', 'Nigel Miskin', 23, 'Konklab');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('9410824079', 'Eleni Luckin', 34, 'Stringtough');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('6113832309', 'Jay Clemas', 41, 'Stringtough');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('4754746201', 'Adelind Lorenc', 36, 'Bitchip');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('9608662362', 'Lee Niccols', 34, 'Bitchip');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('2440578495', 'Waneta Demageard', 41, 'Prodder');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('1065029845', 'Lavina Prene', 36, 'Prodder');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('2299924620', 'Barry Lepiscopi', 38, 'Konklab');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('0182113876', 'Thedric Sommerly', 29, 'Stringtough');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('8450135486', 'Dolli Grossier', 26, 'Bitchip');
insert into player (Player_ID, Player_Name, Player_Age, Current_Team) values ('4710689954', 'Odelle Torra', 19, 'Prodder');

create table player_history (
	Player_Team_ID bigint,
    Player_ID bigint,
    Team_Played_On varchar(100),
		primary key (Player_Team_ID),
        constraint PT_Player_ID_fk foreign key (Player_ID) references player (Player_ID),
        constraint PT_Team_Name_fk foreign key (Team_Played_On) references team (Team_Name));

insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('7568152571', '7635949004', 'Konklab');
insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('8411455816', '7635949004', 'Stringtough');
insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('4983763892', '9410824079', 'Prodder');
insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('2934552973', '2440578495', 'Konklab');
insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('5892144788', '2440578495', 'Konklab');
insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('8777888878', '9410824079', 'Stringtough');
insert into player_history (Player_Team_ID, Player_ID, Team_Played_On) values ('3456127897', '2299924620', 'Bitchip');

create table player_matches (
	Player_Match_ID bigint,
    Player_ID bigint,
    Match_ID bigint,
		primary key (Player_Match_ID),
        constraint PM_Player_ID_fk foreign key (Player_ID) references player (Player_ID),
        constraint PM_Match_ID_fk foreign key (Match_ID) references matches (Match_ID));

insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4197181213', '7635949004', '4167850036');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('5194187223', '7635949004', '5187254066');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('8415516835', '3638831760', '4167850036');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('8516577845', '3638831760', '5187254066');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4492340335', '2299924620', '4167850036');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4523340533', '2299924620', '5187254066');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('7432208670', '7635949004', '6475019283');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('0907540783', '3638831760', '6475019283');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('8134769667', '2299924620', '6475019283');

insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4715733153', '8450135486', '6752579911');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4312743226', '8450135486', '5187254066');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('3507413345', '9608662362', '6752579911');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('1347516322', '9608662362', '5187254066');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('3785317956', '4754746201', '6752579911');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4755213946', '4754746201', '5187254066');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('2375200519', '8450135486', '3597272282');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('7338875782', '9608662362', '3597272282');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('7782756685', '4754746201', '3597272282');

insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('9416509957', '4710689954', '6752579911');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4177615633', '1065029845', '6752579911');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('7795620871', '2440578495', '6752579911');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('9242544779', '4710689954', '6475019283');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('1084978288', '1065029845', '6475019283');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('7359307112', '2440578495', '6475019283');

insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('2973841003', '0182113876', '4167850036');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('8562863181', '6113832309', '4167850036');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('8429227830', '9410824079', '4167850036');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('7516214337', '0182113876', '3597272282');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('9707249021', '6113832309', '3597272282');
insert into player_matches (Player_Match_ID, Player_ID, Match_ID) values ('4908275041', '9410824079', '3597272282');



create table field (
	Field_ID bigint,
    Field_Name varchar(100),
    Address varchar(100),
    Capacity int,
    #Attendance_ID bigint,
		primary key (Field_ID));
##alter table matches add constraint Matches_Field_ID_fk foreign key (Field_ID) references field (Field_ID);

insert into field (Field_ID, Field_Name, Address, Capacity) values ('5641728667', 'Neos Therapeutics Field', '98037 Lien Terrace', 2292);
insert into field (Field_ID, Field_Name, Address, Capacity) values ('1196862877', 'Rayonier Advanced Materials Stadium', '0 Little Fleur Point', 5632);
insert into field (Field_ID, Field_Name, Address, Capacity) values ('7934189656', 'Reading International Arena', '7 Village Green Trail', 7869);
insert into field (Field_ID, Field_Name, Address, Capacity) values ('2589325509', 'The Great Cauldron of Death', '9 Dryden Place', 5005);

alter table team add constraint team_field_fk foreign key (Home_Field) references field (Field_ID);
update team set Home_Field = '5641728667' where Team_Name = 'Stringtough';
update team set Home_Field = '1196862877' where Team_Name = 'Prodder';
update team set Home_Field = '7934189656' where Team_Name = 'Bitchip';
update team set Home_Field = '2589325509' where Team_Name = 'Konklab';

alter table matches add constraint matches_field_fk foreign key (Field_ID) references field (Field_ID);
update matches set Field_ID = '5641728667' where Match_ID = '3597272282';
update matches set Field_ID = '1196862877' where Match_ID = '6475019283';
update matches set Field_ID = '7934189656' where Match_ID = '6752579911';
update matches set Field_ID = '2589325509' where Match_ID = '4167850036';
update matches set Field_ID = '7934189656' where Match_ID = '5187254066';


create table attendance (
	Attendance_ID bigint,
    Match_ID bigint,
    Field_ID bigint,
    Attendance int,
		primary key (Attendance_ID),
        constraint Attendance_Match_ID_fk foreign key (Match_ID) references matches (Match_ID),
        constraint Attendance_Field_ID_fk foreign key (Field_ID) references field (Field_ID));
##alter table field add constraint Field_Attendance_ID_fk foreign key (Attendance_ID) references attendance (Attendance_ID);

insert into attendance (Attendance_ID, Match_ID, Field_ID, Attendance) values ('9685743169', '3597272282', '5641728667', 825);
insert into attendance (Attendance_ID, Match_ID, Field_ID, Attendance) values ('3489607988', '6475019283', '1196862877', 1913);
insert into attendance (Attendance_ID, Match_ID, Field_ID, Attendance) values ('5500682105', '6752579911', '7934189656', 612);
insert into attendance (Attendance_ID, Match_ID, Field_ID, Attendance) values ('7946110499', '4167850036', '2589325509', 1026);


# Queries
# View all upcoming matches in all fields.
select * from matches WHERE Match_Date > sysdate();
# View played matches and their scores
select Home_Team, Home_Score, Away_Team, Away_Score from matches where Match_Date < sysdate();
# Search by team name to view played and upcoming matches
select * from matches where Home_Team = "Stringtough" or Away_Team = "Stringtough";
# Search a player to get the player’s information such as previous teams (if any) and current team.
select distinct p.*, ph.Team_Played_On from player p join player_history ph using(Player_ID) where Player_Name = "Myriam Penna"; 

#Search by coach to get the coach’s information such as previous teams (if any) and current team.
select distinct c.*, ch.Team_Name from coach c join coaching_history ch using (Coach_ID) where Coach_Name = 'Brigitta Ferrulli';

# Search matches in a specific field (multiple queries).

#previous
select distinct m.*, a.attendance from matches m join attendance a using(Field_Id) where Match_Date < sysdate() and Field_Id = 7934189656;
#upcoming

select m.*, a.attendance from matches m join attendance a using(Field_Id) where Match_Date > sysdate() and Field_Id = 7934189656;
#all

select m.*, a.attendance from matches m join attendance a using(Field_Id) where Field_Id = 7934189656;

