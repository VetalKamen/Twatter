# Twatter Init:

1. clone project;
2. run "bundle" to install all required ruby gems;
3. create local database with the name "twatter_development";
4. Log into your local db client and create a user with proper username&password and grand him ALL privileges to newly
   created local Database;
5. go to <root/config/database.yml> and change username&password to yours;
   (the example name\password are already given in the database.yml)
6. open terminal/console from the root of your project and run: "rails db:migrate";
7. run "rails db:seed" to fill the app with predefined fake data;
8. now you must be ready to launch the app by executing: "rails s/server" command;
9. move to url provided by the rails;

# Twatter Test Init:

1. make steps 1-7 from "Twat Init"
2. run "rails db:migrate RAILS_ENV=test"
3. run "rspec spec/models" to test all models
4. run "rails test test/controllers" to test all controllers