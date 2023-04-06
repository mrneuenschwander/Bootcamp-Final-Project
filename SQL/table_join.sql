SELECT "GAME_ID", "TEAM_ID", "PLAYER_ID", "PLAYER_NAME", 
"MIN", "FGM", "FGA", "FG_PCT", "FG3M", 
"FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", 
"REB", "AST", "STL", "BLK", "TO", "PTS"
INTO nba_details2
FROM game_details; 

SELECT  gm."GAME_DATE_EST", gm."GAME_ID", gm."HOME_TEAM_ID",
    gm."VISITOR_TEAM_ID", gm."SEASON", gm."TEAM_ID_home", 
    gm."HOME_TEAM_WINS",tm."TEAM_ID", tm."CONFERENCE", tm."TEAM",
	nd."PLAYER_ID", nd."PLAYER_NAME", 
nd."MIN", nd."FGM", nd."FGA", nd."FG_PCT", nd."FG3M", 
nd."FG3A", nd."FG3_PCT", nd."FTM", nd."FTA", nd."FT_PCT", 
nd."REB", nd."AST", nd."STL", nd."BLK", nd."TO", nd."PTS"
INTO nba_info
FROM games as gm
JOIN nba_details2 as nd
ON gm."GAME_ID" = nd."GAME_ID"
join teams as tm 
on tm."TEAM_ID" = nd."TEAM_ID"

select * 
from nba_info

SELECT tm."TEAM_ID", tm."CONFERENCE", tm."TEAM"
FROM teams as tm
INNER JOIN nba_details
on tm."TEAM_ID" = nba_details."TEAM_ID"

select "GAME_ID"
from game_details

SELECT *
FROM nba_details;