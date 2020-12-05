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
select distinct m.*, a.total_attendance from matches m join attendance a using(Field_Id) where Match_Date < sysdate() and Field_Id = 7934189656;
#upcoming
select m.*, a.total_attendance from matches m join attendance a using(Field_Id) where Match_Date > sysdate() and Field_Id = 7934189656;

#all
select m.*, a.total_attendance from matches m join attendance a using(Field_Id) where Field_Id = 7934189656;

# Show the most popular field’s information (based on the number of matches including played and scheduled).
select * from field F, (SELECT Field_ID, COUNT(Field_ID) AS Frequency FROM matches GROUP BY Field_ID
    ORDER BY Frequency DESC LIMIT 1) MF where F.Field_ID = MF.Field_ID;
    
#	Which match had the largest number of attendees and where was it played.
select * from matches m join field using (field_id), (select Field_Id from attendance order by total_attendance desc limit 1) ba where m.field_id = ba.field_id