#Chitter Challenge

This is my solution to the fourth weekend challenge at Makers Academy. We had to fulfil the following user stories

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

We were also given the following hints on functionality:

```
- Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Use bcrypt to secure the passwords.
- Use data mapper and postgres to save the data.
- You don't have to be logged in to see the peeps.
- You only can peep if you are logged in.
```

#Usage

1. Clone this repo
2. Run `bundle`
3. Open `psql` and `createdb chitter_development`
4. Run `rake auto_migrate RACK_ENV=development` to set up the database
5. Run `rackup`
6. Point your browser to http://localhost:9292

This app is also [hosted on Heroku](ivan-chitter-app.herokuapp.com)

You can also run rspec to see details of the feature and unit tests:

```
peep management
  creating a peep
    is not possible if not signed in
    happens when signed in
  viewing peeps
    can see username next to peep
    can see peeps when not logged
    peeps shown in reverse chronological order
    peeps display timestamp

managing users
  signing in require correct credentials
  signing in does not occur with incorrect credentials
  signing out displays a goodbye message
  signing up
    requires a matching password
    increases user count
    displays a welcome message

User
  authenticates when given a valid username and password
  does not authenticate when given an incorrect password
```
