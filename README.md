# Sinatra Mandrill Statistics

####About the app:
An application that reads data from a file `llirdnam.go` and posts stats accordingly
A few things that it shows currently are:
- total number of emails sent
- total number of emails opened
- total number of clicks
- open rate per email type
- click rate per email type

### Technologies which and why:

#### Sinatra:

As this was a really small application so have tried to make it as light weight as possible.

#### sqlite3:

Easy to setup and goes well with sinatra

#### Test suite:

Rspec for unit testing and Capybara for the headless testing.

#### Start the application:

- Run `bundle install` to install all the required gems
- Migrate the database `rake db:Migrate`
- Start the server with `ruby app.rb`
- Start the llirdnam app by running http://localhost:4567/emails
- Go to http://localhost:4567

#### Running the test suite
- Run `rspec` to see the test suite

#### Struggles:

- Setting up the application `llirdnam.go` was a bit tricky, as this was the first I have seen go.
