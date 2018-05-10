# README

This rails app is for I Know First users

If you receive the emails from them, you can set up a
server (on heroku for example) that will get the emails
and save them to a structured database

Every day you'll have new data with the stocks ticker 
and predictions and its easier to query it this way

To get it up and running:
1. Clone the app
2. Set up heroku app with database, rollbar, and mailgun add ons
3. Push the app to heroku
4. run rake db:migrate
3. Connect the mailgun to the end point POST /stocks
4. Query the data to get better results :)
