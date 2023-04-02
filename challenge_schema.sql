-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "clean_ranking" (
    "TEAM_ID" int   NOT NULL,
    "CONFERENCE" varchar(10)   NOT NULL,
    "TEAM" varchar(50)   NOT NULL,
    "G" int   NOT NULL,
    "W" int   NOT NULL,
    "L" int   NOT NULL,
    "W_PCT" float   NOT NULL,
    "DATE" date   NOT NULL,
    CONSTRAINT "pk_clean_ranking" PRIMARY KEY (
        "TEAM_ID"
     )
);

CREATE TABLE "clean_games_details" (
    "GAME_ID" int   NOT NULL,
    "TEAM_ID" int   NOT NULL,
    "PLAYER_ID" int   NOT NULL,
    "PLAYER_NAME" varchar(50)   NOT NULL,
    "MIN" time   NOT NULL,
    "FGM" int   NOT NULL,
    "FGA" int   NOT NULL,
    "FG_PCT" float   NOT NULL,
    "FG3M" int   NOT NULL,
    "FG3A" int   NOT NULL,
    "FG3_PCT" float   NOT NULL,
    "FTM" int   NOT NULL,
    "FTA" int   NOT NULL,
    "FT_PCT" float   NOT NULL,
    "REB" int   NOT NULL,
    "AST" int   NOT NULL,
    "STL" int   NOT NULL,
    "BLK" int   NOT NULL,
    "TO" int   NOT NULL,
    "PTS" int   NOT NULL,
    CONSTRAINT "pk_clean_games_details" PRIMARY KEY (
        "GAME_ID"
     )
);

CREATE TABLE "clean_games" (
    "GAME_DATE_EST" date   NOT NULL,
    "GAME_ID" int   NOT NULL,
    "HOME_TEAM_ID" int   NOT NULL,
    "VISITOR_TEAM_ID" int   NOT NULL,
    "SEASON" int   NOT NULL,
    "TEAM_ID_home" int   NOT NULL,
    "PTS_home" int   NOT NULL,
    "FG_PCT_home" float   NOT NULL,
    "FT_PCT_home" float   NOT NULL,
    "FG3_PCT_home" float   NOT NULL,
    "AST_home" int   NOT NULL,
    "REB_home" int   NOT NULL,
    "TEAM_ID_away" int   NOT NULL,
    "PTS_away" int   NOT NULL,
    "FG_PCT_away" float   NOT NULL,
    "FT_PCT_away" float   NOT NULL,
    "FG3_PCT_away" float   NOT NULL,
    "AST_away" int   NOT NULL,
    "REB_away" int   NOT NULL,
    "HOME_TEAM_WINS" int   NOT NULL,
    CONSTRAINT "pk_clean_games" PRIMARY KEY (
        "SEASON"
     )
);

CREATE TABLE "players" (
    "PLAYER_NAME" VARCHAR(50)   NOT NULL,
    "TEAM_ID" int   NOT NULL,
    "PLAYER_ID" int   NOT NULL,
    "SEASON" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "PLAYER_ID"
     )
);

ALTER TABLE "clean_games_details" ADD CONSTRAINT "fk_clean_games_details_TEAM_ID" FOREIGN KEY("TEAM_ID")
REFERENCES "clean_ranking" ("TEAM_ID");

ALTER TABLE "clean_games_details" ADD CONSTRAINT "fk_clean_games_details_PLAYER_ID" FOREIGN KEY("PLAYER_ID")
REFERENCES "players" ("PLAYER_ID");

ALTER TABLE "clean_games" ADD CONSTRAINT "fk_clean_games_GAME_ID" FOREIGN KEY("GAME_ID")
REFERENCES "clean_games_details" ("GAME_ID");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_SEASON" FOREIGN KEY("SEASON")
REFERENCES "clean_games" ("SEASON");

