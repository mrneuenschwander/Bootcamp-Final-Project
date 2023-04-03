# Bootcamp-Final-Project
Authors:<br>
    Mitch Neuenschwander<br>
    Andy Kawamoto<br>
    Kelvin Molina<br>
    Grayson W-idontknowyourlastname<br>

## Deliverable 1: EDA and choosing a topic.

### Week 1
The first Deliverable of the Final Challenge is straightforward. The goal was to decide on a question, find a dataset that would allow us to answer it effectively, and begin manipulation and prototype modeling of that set. 

The question we decided on came after a long while, and after bouncing from facet to facet within the same subject: the prediction of the NBA's next pool of MVP candidates, more specificallly which factors made a player more likely to be selected. Using a dataset from Kaggle, we ammassed a trove of data to be looked through, and began the EDA process to know what we were working with.

We decided on a "rubberband" approach, where we started in Python, moved it to SQL for further manipulation and table generation, and then back to Python to prototype and run a Machine Learning model. The model has yet to be decided, but a Supervised Machine Learner is so far looking to be the most appropriate approach. The usual SQL challenges were present, cheifly surrounding the CSV imports to their respective tables. After initial failed attempts and further EDA, it was found that the formatting of certain columns (really just the time-related ones) was in a format that would not be accepted by a database. Further cleaning was done to format the minute values correctly, and drop the null values from the remade CSV. Ultimately, it was a good excersize in understanding that even though work looks complete, there will occasionally need to be backtracking and further modification before returning to a workable point. 

This is the first "real" dataset that we have worked with, in that it is raw and unedited by the Bootcamp Curriculum. It's nice to see the methods we've learned being applied in a "real-world" situation, and knowing it works without a starter code or a framework already in place.

#### Database
We used pgAdmin as our database program and created 4 tables - clean_games, clean_games_details, clean_ranking, and players - to hold the data. At first, extra columns needed to be removed as they were not lining up with the generated schema. Steps were taken to address this, as mentioned above. Once the CSV's are formatted correctly, they will drop into place without conflicts and we can begin the SQL transformation process.
