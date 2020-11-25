create table team (
	Team_Name varchar(100), 
    Team_Match_ID int,
    Current_Coach varchar(100),
		primary key (Team_Name));

create table team_match (
	Team_Match_ID int auto_increment,
    Team_Name varchar(100),
    Matches_Won int,
    Matches_Lost int,
		primary key (Team_Match_ID),
        constraint TM_Team_Name_fk foreign key (Team_Name) references team (Team_Name));
alter table team add constraint Team_Match_ID_fk foreign key (Team_Match_ID) references team_match (Team_Match_ID);

create table coach (
	Coach_ID int auto_increment,
    Coach_Name varchar(100),
    Coach_Age int,
    Current_Team varchar(100),
    Coach_Team_ID int,
		primary key (Coach_ID),
        constraint Coach_Current_Team_fk foreign key (Current_Team) references team (Team_Name));
# don't know why this foreign key won't work, but this is needed
# alter table team add constraint Team_Current_Coach_fk foreign key (Current_Coach) references coach (Coach_Name);
create table coaching_history (
	Coach_Team_ID int auto_increment,
    Coach_ID int,
    Team_Name varchar(100),
		primary key (Coach_Team_ID),
        constraint CH_Coach_ID_fk foreign key (Coach_ID) references coach (Coach_ID),
        constraint CH_Team_Name_fk foreign key (Team_Name) references team (Team_Name));
alter table coach add constraint Coach_Coach_Team_ID_fk foreign key (Coach_Team_ID) references coaching_history (Coach_Team_ID);

create table player (
	Player_ID int auto_increment,
    Player_Name varchar(100),
    Player_Age int,
    Current_Team varchar(100),
		primary key (Player_ID),
        constraint player_Current_Team_fk foreign key (Current_Team) references team (Team_Name));

create table player_matches (
	Player_Match_ID int auto_increment,
    Player_ID int,
    Match_ID int,
		primary key (Player_Match_ID),
        constraint PM_Player_ID_fk foreign key (Player_ID) references player (Player_ID));

create table matches (
	Match_ID int auto_increment,
    Home_Team varchar(100),
    Away_Team varchar(100),
    Home_Score int,
    Away_Score int,
    Winner varchar(100),
    Match_Day int(2),
    Match_Month int(2),
    Match_Year int(4),
    Field_ID int,
		primary key (Match_ID),
        constraint match_Home_Team_fk foreign key (Home_Team) references team (Team_Name),
		constraint match_Away_Team_fk foreign key (Away_Team) references team (Team_Name));
alter table team_match add constraint TM_Matches_Won_fk foreign key (Matches_Won) references matches (Match_ID);
alter table team_match add constraint TM_Matches_Lost_fk foreign key (Matches_Lost) references matches (Match_ID);
alter table player_matches add constraint PM_Match_ID_fk foreign key (Match_ID) references matches (Match_ID);

create table field (
	Field_ID int auto_increment,
    Field_Name varchar(100),
    Address varchar(100),
    Capacity int,
    Attendance_ID int,
		primary key (Field_ID));
alter table matches add constraint Matches_Field_ID_fk foreign key (Field_ID) references field (Field_ID);

create table attendance (
	Attendance_ID int auto_increment,
    Match_ID int,
    Field_ID int,
    Attendance int,
		primary key (Attendance_ID),
        constraint Attendance_Match_ID_fk foreign key (Match_ID) references matches (Match_ID),
        constraint Attendance_Field_ID_fk foreign key (Field_ID) references field (Field_ID));
alter table field add constraint Field_Attendance_ID_fk foreign key (Attendance_ID) references attendance (Attendance_ID);
