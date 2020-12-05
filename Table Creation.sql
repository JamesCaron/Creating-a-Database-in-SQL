create table team (
	Team_Name varchar(100) unique, 
    #Team_Match_ID bigint,
    #Current_Coach bigint,
    Home_Field bigint,
		primary key (Team_Name));
        
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
        
create table team_match (
	Team_Match_ID bigint,
    Team_Name varchar(100),
    Match_ID bigint,
    Match_Winner varchar(100),
    Match_Loser varchar(100),
		primary key (Team_Match_ID),
        constraint TM_Team_Name_fk foreign key (Team_Name) references team (Team_Name),
        constraint TM_Match_ID_fk foreign key (Match_ID) references matches (Match_ID));
        
create table coach (
	Coach_ID bigint,
    Coach_Name varchar(100),
    Coach_Age bigint,
    Current_Team varchar(100),
    #Coach_Team_ID bigint,
		primary key (Coach_ID),
        constraint Coach_Current_Team_fk foreign key (Current_Team) references team (Team_Name));
        
create table coaching_history (
	Coach_Team_ID bigint,
    Coach_ID bigint,
    Team_Name varchar(100),
		primary key (Coach_Team_ID),
        constraint CH_Coach_ID_fk foreign key (Coach_ID) references coach (Coach_ID),
        constraint CH_Team_Name_fk foreign key (Team_Name) references team (Team_Name));
        
create table player (
	Player_ID bigint,
    Player_Name varchar(100),
    Player_Age int,
    Current_Team varchar(100),
		primary key (Player_ID),
        constraint player_Current_Team_fk foreign key (Current_Team) references team (Team_Name));
        
create table player_history (
	Player_Team_ID bigint,
    Player_ID bigint,
    Team_Played_On varchar(100),
		primary key (Player_Team_ID),
        constraint PT_Player_ID_fk foreign key (Player_ID) references player (Player_ID),
        constraint PT_Team_Name_fk foreign key (Team_Played_On) references team (Team_Name));
        
create table player_matches (
	Player_Match_ID bigint,
    Player_ID bigint,
    Match_ID bigint,
		primary key (Player_Match_ID),
        constraint PM_Player_ID_fk foreign key (Player_ID) references player (Player_ID),
        constraint PM_Match_ID_fk foreign key (Match_ID) references matches (Match_ID));
        
create table field (
	Field_ID bigint,
    Field_Name varchar(100),
    Address varchar(100),
    Capacity int,
    #Attendance_ID bigint,
		primary key (Field_ID));
alter table team add constraint team_field_fk foreign key (Home_Field) references field (Field_ID);
alter table matches add constraint matches_field_fk foreign key (Field_ID) references field (Field_ID);

create table attendance (
	Attendance_ID bigint,
    Match_ID bigint,
    Field_ID bigint,
    Total_Attendance int,
		primary key (Attendance_ID),
        constraint Attendance_Match_ID_fk foreign key (Match_ID) references matches (Match_ID),
        constraint Attendance_Field_ID_fk foreign key (Field_ID) references field (Field_ID));