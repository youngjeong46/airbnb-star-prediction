# Predicting Airbnb 5 Star Ratings


## Overview

This project took Seattle AirBnB listings data and used it to build a classification model. The model predicts whether a listing for AirBnB will receive a 5-star ratings or not. Blog post on the project can be found [here]("https://datatostories.com/posts/2019/05/11/airbnb-ratings-predictions/").

**I also created a Web Application where users can input information about their (potential) listings and find out the probability of it receiving a 5-star ratings. The app will also suggest one amenity addition that will boost the probability the highest. You can see the web app github repo [here](https://github.com/youngjeong46/airbnb-star-prediction-app), and see the application in action [here](http://airbnb-ratings-app.herokuapp.com/).**


## Project Design

Having previously been an AirBnB host, I know the importance of obtaining and maintaining a 5-star Rating. It leads to an opportunity for the SuperHost designation, a status which leads to more search exposure and about 50% increase in monthly income. I believe how a host curates his or her listings and what they provide is reflected in the ratings and decided to put the theory to a test.

Insideairbnb.com is an independent research company focused on data visualization of AirBnB and its impact in major cities. They have collected a nice dataset on AirBnB listings in those cities, including Seattle. Using that data, along with Walkscore.com's API, I collected a dataset that I believe had features correlate with ratings. I ran various classification models with parameter tuning via Cross Validation. The models include:

- Logistic Regression
- K-Nearest Neighbors
- Support Vector Machine
- Decision Trees
- Random Forest
- Gradient Boosting
- Adaptive Boosting
- Catboosting
- XG Boosting

TThe metric I used to select the best model was the ROC-AUC score (Receiver Operating Characteristics Area Under the Curve). The best models using the ROC-AUC as the metric were the boosting CART models, with the XGBoost scoring 0.7891, followed by Catboost at 0.7837, Gradient Boosting at 0.7795, and Adaptive Boosting at 0.7757. Even though I could have chosen XGBoost as my model, the difference in metric performance wasn't enough to make a decision here. Therefore, I also chose to look at time performance (in terms of test predictions).

Comparing the time performance between the 4 Boosting Models, Gradient Boosting performed the fastest at 0.8168 seconds. It was 3 times faster than next fastest model (Adaptive boost at 2.39 seconds), and more than 8 times faster than XGBoost (6.84 seconds). Considering product implementation, I chose the Gradient Boost as the model of choice for its excellent timing performance.

Using the model produced I made predictions on the holdout (test) set. The ROC-AUC score for the test set was 0.71.

Some potential improvements can be made, and some that I want to implement include Description NLP to be able to suggest keywords for hosts to describe their listings with and Zillow/Redfin Integration for potential hosts that wants to purchase properties with the sole purpose of running AirBnB rental units.

## Tools

- Data Collection: Google Geocode API, Walkscore.com API
- Data Storage: Pandas, pickle
- Data Visualization: Seaborn, Matplotlib
- Data Analysis: Scikit-learn, XGBoost, Catboost
- Presentation: Google Slides
- Web Application: Flask, Bootstrap



## Project Organization 

The structure of the project organization is adapted from Cliff Clive's [DataScienceMVP](https://github.com/cliffclive/datasciencemvp), which itself is adapted from the famous Data Science project structure from Cookiecutters that you can access [here](https://github.com/drivendata/cookiecutter-data-science/).

```
    ├── LICENSE
    ├── README.md          <- The top-level README for developers using this project.
    ├── main.py            <- The top-level src code for this project.
    ├── setup.sql          <- (Optional) PostgreSQL setup file. (It was not used)
    ├── data
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── results            <- Trained and serialized models, model predictions, or model summaries
    │   ├── models         <- Generated model records stored in pickle files
    │   └── records        <- All generated records about the project in pickle files
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         The step in the workflow (i.e. Obtain_Data)
    │                         `1_Obtain_Data.ipynb`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   ├── figures        <- Generated graphics and figures to be used in reporting
    │   ├── MVP.ipynb      <- The general overview of project in Jupyter Notebook.
    │   └── slide_deck     <- Slide deck for a short presentation.
    │
    ├── src                <- Source code for use in this project.
    │   ├── __init__.py    <- Makes src a Python module
    │   ├── obtain.py      <- Makes src a Python module
    │   ├── scrub.py       <- Makes src a Python module
    │   ├── explore.py     <- Makes src a Python module
    │   ├── model.py       <- Makes src a Python module
    │   ├── interpret.py   <- Makes src a Python module

```

## Appendix: Features Used

| Features | Type         |  Description | 
| -------- | ------------ |------------- |
| neighborhood\_group_cleansed  | Str |Neighborhood in Seattle |
| room_type  | Str |Type of room offered (Room or whole house)|
| bedrooms  | Int |Number of bedrooms |
| bathrooms  | Float | Number of bathrooms |
| beds  | Int | Number of beds |
| price  | Int | Nightly price of the listings (in Dollars) |
| security_deposit  | Int | Security Deposit required (in Dollars) |
| cleaning_fee  | Int | Cleaning Fee charged (in Dollars) |
| extra_people  | Int | Charge for having extra people (in Dollars)|
| minimum_nights  | Int | Minimum nights required for a reservation|
| calendar_updated  | Int | how often the host updates the availability calendar |
| availability_30 | Int | How many days are available for reservation in the next 30 Days |
| availability_90  | Int |How many days are available for reservation in the next 90 Days|
| cancellation_policy  | Bool | Is the cancellation policy flexible or not? (True if yes) |
| instant_bookable  | Bool | Is the listing instantly bookable without host's review? (True if yes) |
| Bikescore  | Int | A listing's Bikescore |
| Walkscore  | Int | A listing's Walkscore |
| 24-hour check-in  | Bool | Does the listing provide A/C? (1 if yes, 0 if no) |
| BBQ grill  | Bool | Does the listing provide a BBQ Grill? (1 if yes, 0 if no) |
| Bed linens  | Bool | Does the listing provide extra Bed linens? (1 if yes, 0 if no) |
| Cable TV  | Bool | Does the listing provide cable TV? (1 if yes, 0 if no) |
| Coffee Maker  | Bool | Does the listing provide a coffee maker? (1 if yes, 0 if no) |
| Dishwasher  | Bool | Does the listing provide a dishwasher? (1 if yes, 0 if no) |
| Elevator  | Bool | Is there an elevator access for the listing? (1 if yes, 0 if no) |
| Extra pillows and blankets  | Bool | Does the listing provide extra pillows/blankets? (1 if yes, 0 if no) |
| Family/kid friendly  | Bool | Is the listing family and/or kid-friendly? (1 if yes, 0 if no) |
| Fire extinguisher  | Bool | Does the listing provide a fire extinguisher? (1 if yes, 0 if no) |
| First aid kit  | Bool | Does the listing provide a first aid kit? (1 if yes, 0 if no) |
| Gym  | Bool | Does the listing provide gym access? (1 if yes, 0 if no) |
| Indoor fireplace | Bool | Does the listing provide indoor fireplace? (1 if yes, 0 if no) |
| Internet  | Bool | Does the listing provide internet? (1 if yes, 0 if no) |
| Keypad  | Bool | Does the listing provide a keypad entry access? (1 if yes, 0 if no) |
| Lock on bedroom door  | Bool | Does the listing have locks on its bedroom(s)? (1 if yes, 0 if no) |
| Lockbox  | Bool | Does the listing provide a lockbox for access? (1 if yes, 0 if no) |
| Long term stays allowed  | Bool | Does the listing allow for long term stay? (1 if yes, 0 if no) |
| Luggage dropoff allowed  | Bool | Is luggage dropoff allowed prior to reservation? (1 if yes, 0 if no) |
| Pack 'n play/travel crib  | Bool | Does the listing provide Pack'n Play or travel crib? (1 if yes, 0 if no) |
| Patio or balcony  | Bool | Does the listing have a patio or balcony? (1 if yes, 0 if no) |
| Pets | Bool | Does the listing allow pets? (1 if yes, 0 if no) |
| Private entrance  | Bool | Does the listing have a private entrance? (1 if yes, 0 if no) |
| Private living room  | Bool | Does the listing have a private living room? (1 if yes, 0 if no) |
| Refrigerator  | Bool | Does the listing come with a refrigerator? (1 if yes, 0 if no) |
| Safety card  | Bool | Does the listing provide a safety card? (1 if yes, 0 if no) |
| self check-in  | Bool | Does the listing have self check-in? (1 if yes, 0 if no) |