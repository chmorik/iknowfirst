# README

This rails app is for I Know First users

If you receive the emails from them, you can set up a
server (on heroku for example) that will get the emails
and save them to a structured database

Every day you'll have new data with the stocks ticker 
and predictions and its easier to query it this way

You'll have stocks table in the database and its structure is

0. id
1. date 
2. symbol 
3. signal3
4. pred3
5. signal7
6. pred7
7. signal14
8. pred14
9. signal31
9. pred31
9. signal92
9. pred92
9. signal365
9. pred365
9. created_at
9. updated_at

To get it up and running:
1. Clone the app
2. Set up heroku app with database, rollbar, and mailgun add ons
3. Push the app to heroku
4. run rake db:migrate
3. Connect the mailgun to the end point POST /stocks
4. Query the data to get better results :)
