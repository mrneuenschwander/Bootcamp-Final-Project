# Bootcamp Final Project<br>
Authors:<br>
    Mitch Neuenschwander<br>
    Andy Kawamoto<br>
    Kelvin Molina<br>
    Grayson W-idontknowyourlastname<br>

## Deliverable 1: EDA Deep Dives, And Choosing A Topic.

### Week 1
The first Deliverable of the Final Challenge is straightforward. The goal was to decide on a question, find a dataset that would allow us to answer it effectively, and begin manipulation and prototype modeling of that set. 

The question we decided on came after a long while, and after bouncing from facet to facet within the same subject: the prediction of the NBA's next pool of MVP candidates, more specificallly which factors made a player more likely to be selected. Using a dataset from Kaggle, we ammassed a trove of data to be looked through, and began the EDA process to know what we were working with.

We decided on a self-titled "rubberband" approach, where we started in Python, moved to SQL for further manipulation and final table generation, and then back to Python to prototype and run a Machine Learning model. The model type has yet to be decided, but a Supervised Machine Learner is so far looking to be the most appropriate. On what we thought to be the completion of cleaning the data, the usual SQL challenges were present, cheifly surrounding the CSV imports to their respective tables. After several unsuccessful brute-force attempts and subsequently further EDA, we found that the various Date and Time columns were mis-typed as objects, and they would not be accepted by our database. Further cleaning was warranted to format those column values correctly, and eliminate a handful of newly-minted null values and columns from the remade CSVs. 

Ultimately, it is a good excersize in understanding that even though work looks complete, there will occasionally need to be backtracking and further modification before returning to a workable point. This is the first "real" dataset that we have worked with, in that it is raw and unedited by the Bootcamp Curriculum. It's nice to see the methods we've learned being applied in a "real-world" situation, and knowing it works without a starter code or a framework already in place.

#### Database
We used pgAdmin as our database program and created 4 tables - clean_games, clean_games_details, clean_ranking, and players - to hold the data. At first, extra columns needed to be removed as they were not lining up with the generated schema. Steps were taken to address this, as mentioned above. Once the CSV's are formatted correctly, they will drop into place without conflicts and we can begin the SQL transformation process.
