# Bootcamp Final Project<br>
Authors:<br>
    Mitch Neuenschwander<br>
    Andy Kawamoto<br>
    Kelvin Molina<br>
    Grayson Workman<br>

## Deliverable 1: EDA Deep Dives, And Choosing A Topic.

### Week 1
The first Deliverable of the Final Challenge is straightforward. The goal was to decide on a question, find a dataset that would allow us to answer it effectively, and begin manipulation and prototype modeling of that set. 

The question we decided on came after a long while, and after bouncing from facet to facet within the same subject: the prediction of the NBA's next pool of MVP candidates, more specificallly which factors made a player more likely to be selected. Using a dataset from Kaggle, we ammassed a trove of data to be looked through, and began the EDA process to know what we were working with.

We decided on a self-titled "rubberband" approach, where we started in Python, moved to SQL for further manipulation and final table generation, and then back to Python to prototype and run a Machine Learning model. The model type has yet to be decided, but a Supervised Machine Learner is so far looking to be the most appropriate. On what we thought to be the completion of cleaning the data, the usual SQL challenges were present, cheifly surrounding the CSV imports to their respective tables. After several unsuccessful brute-force attempts and subsequently further EDA, we found that the various Date and Time columns were mis-typed as objects, and they would not be accepted by our database. Further cleaning was warranted to format those column values correctly, and eliminate a handful of newly-minted null values and columns from the remade CSVs. 

Ultimately, it is a good excersize in understanding that even though work looks complete, there will occasionally need to be backtracking and further modification before returning to a workable point. This is the first "real" dataset that we have worked with, in that it is raw and unedited by the Bootcamp Curriculum. It's nice to see the methods we've learned being applied in a "real-world" situation, and knowing it works without a starter code or a framework already in place.

#### Database
The work around the database highlighted the difficulty in the data cleanup steps prior to using a machine learning model.  We had to address duplicates, nulls, non-unique values, columns with mixed datatypes, or datatypes that didn't seem to line up well from Python to SQL.  There was a lot of work around determine which data or time information we needed and how to format it correctly.  

We used pgAdmin as our database program and quickdatabase.com as our ERD generator.  There was a lot of troublshooting that had to be researched based on the error codes displayed when either creating the tables or when uploading the data into the table. Error codes such as:
![sql_error](resources/photos/sql_error.png)  

We created 4 tables for our data:
* games
* games_details
* teams
* player 

We decided we only needed to connect **games, game_details,** and **teams**.  

At first, extra columns needed to be removed as they were not lining up with the generated schema. Steps were taken to address this, as mentioned above. The biggest hurdle was to find unique columns or Primary Keys to link the table together, so composite primary keys were created. As a group we had to decide which information was important for our model, and as a result modified the **ranking.csv** to a **teams.csv** which listed the teams in the NBA. We also decided that the **players.csv** will be cross referenced after the machine learning model determines which players are in contention for the MVP based on their player_ID number.   We then had to modify the SQL code and the CSV's so they matched appropriately and were able to successfully load our data into the database with appropraitely connected tables. 

Once the database was fully operational, it was time to disect each table and extract the important columns from each table and join them into a completely new table, which brought new obstacles for our team. Some of the column names in the tables were also function keys, so to correct this issue, we decided to put all of the column titles in quotes(" "). To get all of the columns we wanted, we joined the tables with a regular join between them so none of the data was lost or duplicated. We pushed all of the columns into a new table named **nba_info**. Here is a look into the SQL query used to create the new table.
```
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
```

We could have pulled all of the tables directly from Pgadmin using Python by writing code like the following:
```
import psycopg2
import requests

conn = psycopg2.connect(
            host = "localhost",
            database = "final_project",
            user = "postgres",
            password = "****")

cur = conn.cursor()

nba_data = cur.execute("select * from nba_info")

nba_data = cur.fetchall()

print(nba_data)
```
but with multiple people working on this project, we decided to transfer the new table into a .csv file so it may be accessible for everyone without creating a Postgres database for each member.


### Tableau
https://public.tableau.com/app/profile/grayson.w./viz/NBA_MVP_UofUDS/NBAMVPBreakdown?publish=yes


### Challenges
Clearly no one expected this entire analysis to go smoothly without any challenges. From the start, the journey to find the right data that will work for our analysis. We looked at web scraping options, other sports sites that provided documentation. We chose data from Kaggle. Although we chose the best data, from the beginning we learned that we needed to modify all of our data and remove columns and then create new columns. Then new errors would arise trying to upload the data into postgres. We had constant and ongoing EDA. EDA never ends as you learn more about your data as you go. 
 and learning that our model doesnt work. Test train split doesnt work. 