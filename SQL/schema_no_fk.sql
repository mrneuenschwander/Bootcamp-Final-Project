-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "ranking" (
    "TEAM_ID" INT   NOT NULL,
    "CONFERENCE" VARCHAR(50)   NOT NULL,
    "TEAM" VARCHAR(50)   NOT NULL,
    "G" INT   NOT NULL,
    "W" INT   NOT NULL,
    "L" INT   NOT NULL,
    "W_PCT" FLOAT   NOT NULL,
    "DATE" DATE   NOT NULL,
    "RANK_ID" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_ranking" PRIMARY KEY (
        "RANK_ID"
     )
);

CREATE TABLE "game_details" (
    "GAME_ID" INT   NOT NULL,
    "TEAM_ID" INT   NOT NULL,
    "PLAYER_ID" INT   NOT NULL,
    "PLAYER_NAME" VARCHAR(50)   NOT NULL,
    "MIN" FLOAT   NOT NULL,
    "FGM" FLOAT   NOT NULL,
    "FGA" FLOAT   NOT NULL,
    "FG_PCT" FLOAT   NOT NULL,
    "FG3M" FLOAT   NOT NULL,
    "FG3A" FLOAT   NOT NULL,
    "FG3_PCT" FLOAT   NOT NULL,
    "FTM" FLOAT   NOT NULL,
    "FTA" FLOAT   NOT NULL,
    "FT_PCT" FLOAT   NOT NULL,
    "REB" FLOAT   NOT NULL,
    "AST" FLOAT   NOT NULL,
    "STL" FLOAT   NOT NULL,
    "BLK" FLOAT   NOT NULL,
    "TO" FLOAT   NOT NULL,
    "PTS" FLOAT   NOT NULL,
    "UNIQUE_ID" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_game_details" PRIMARY KEY (
        "UNIQUE_ID"
     )
);

CREATE TABLE "games" (
    "GAME_DATE_EST" DATE   NOT NULL,
    "GAME_ID" INT   NOT NULL,
    "HOME_TEAM_ID" INT   NOT NULL,
    "VISITOR_TEAM_ID" INT   NOT NULL,
    "SEASON" DATE   NOT NULL,
    "TEAM_ID_home" INT   NOT NULL,
    "PTS_home" FLOAT   NOT NULL,
    "FG_PCT_home" FLOAT   NOT NULL,
    "FT_PCT_home" FLOAT   NOT NULL,
    "FG3_PCT_home" FLOAT   NOT NULL,
    "AST_home" FLOAT   NOT NULL,
    "REB_home" FLOAT   NOT NULL,
    "TEAM_ID_away" INT   NOT NULL,
    "PTS_away" FLOAT   NOT NULL,
    "FG_PCT_away" FLOAT   NOT NULL,
    "FT_PCT_away" FLOAT   NOT NULL,
    "FG3_PCT_away" FLOAT   NOT NULL,
    "AST_away" FLOAT   NOT NULL,
    "REB_away" FLOAT   NOT NULL,
    "HOME_TEAM_WINS" INT   NOT NULL,
    "REFERENCE" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "REFERENCE"
     )
);

CREATE TABLE "players" (
    "PLAYER_NAME" VARCHAR(50)   NOT NULL,
    "TEAM_ID" INT   NOT NULL,
    "PLAYER_ID" INT   NOT NULL,
    "SEASON" DATE   NOT NULL,
    "TABLE_ID" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "TABLE_ID"
     )
);

