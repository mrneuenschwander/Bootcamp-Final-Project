-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "ranking" (
    "TEAM_ID" int   NOT NULL,
    "CONFERENCE" varchar(50)   NOT NULL,
    "TEAM" varchar(50)   NOT NULL,
    "G" int   NOT NULL,
    "W" int   NOT NULL,
    "L" int   NOT NULL,
    "W_PCT" float   NOT NULL,
    "DATE" date   NOT NULL,
    CONSTRAINT "pk_ranking" PRIMARY KEY (
        "TEAM_ID"
     )
);

CREATE TABLE "game_details" (
    "GAME_ID" int   NOT NULL,
    "TEAM_ID" int   NOT NULL,
    "PLAYER_ID" int   NOT NULL,
    "PLAYER_NAME" varchar(50)   NOT NULL,
    "MIN" float   NOT NULL,
    "FGM" float   NOT NULL,
    "FGA" float   NOT NULL,
    "FG_PCT" float   NOT NULL,
    "FG3M" float   NOT NULL,
    "FG3A" float   NOT NULL,
    "FG3_PCT" float   NOT NULL,
    "FTM" float   NOT NULL,
    "FTA" float   NOT NULL,
    "FT_PCT" float   NOT NULL,
    "REB" float   NOT NULL,
    "AST" float   NOT NULL,
    "STL" float   NOT NULL,
    "BLK" float   NOT NULL,
    "TO" float   NOT NULL,
    "PTS" float   NOT NULL,
    CONSTRAINT "pk_game_details" PRIMARY KEY (
        "GAME_ID"
     )
);

CREATE TABLE "games" (
    "GAME_DATE_EST" date   NOT NULL,
    "GAME_ID" int   NOT NULL,
    "HOME_TEAM_ID" int   NOT NULL,
    "VISITOR_TEAM_ID" int   NOT NULL,
    "SEASON" date   NOT NULL,
    "TEAM_ID_home" int   NOT NULL,
    "PTS_home" float   NOT NULL,
    "FG_PCT_home" float   NOT NULL,
    "FT_PCT_home" float   NOT NULL,
    "FG3_PCT_home" float   NOT NULL,
    "AST_home" float   NOT NULL,
    "REB_home" float   NOT NULL,
    "TEAM_ID_away" int   NOT NULL,
    "PTS_away" float   NOT NULL,
    "FG_PCT_away" float   NOT NULL,
    "FT_PCT_away" float   NOT NULL,
    "FG3_PCT_away" float   NOT NULL,
    "AST_away" float   NOT NULL,
    "REB_away" float   NOT NULL,
    "HOME_TEAM_WINS" int   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "SEASON"
     )
);

CREATE TABLE "players" (
    "PLAYER_NAME" VARCHAR(50)   NOT NULL,
    "TEAM_ID" int   NOT NULL,
    "PLAYER_ID" int   NOT NULL,
    "SEASON" period   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "PLAYER_NAME"
     )
);

ALTER TABLE "game_details" ADD CONSTRAINT "fk_game_details_TEAM_ID" FOREIGN KEY("TEAM_ID")
REFERENCES "ranking" ("TEAM_ID");

ALTER TABLE "game_details" ADD CONSTRAINT "fk_game_details_PLAYER_ID" FOREIGN KEY("PLAYER_ID")
REFERENCES "players" ("PLAYER_ID");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_GAME_ID" FOREIGN KEY("GAME_ID")
REFERENCES "game_details" ("GAME_ID");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_SEASON" FOREIGN KEY("SEASON")
REFERENCES "games" ("SEASON");

