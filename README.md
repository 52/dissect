# Dissecting Rails 5

A portfolio I made while taking the [Dissecting Ruby on Rails 5 course](https://www.udemy.com/professional-rails-5-development-course/)

## Poking around
This is hosted on Heroku at [http://dissect-rails-5.herokuapp.com/](http://dissect-rails-5.herokuapp.com/).  
Feel free to poke around using this account:  
```
Email:    admin@local.com
Password: 123
```
Note: The commenting on blog post feature won't work because it uses ActionCable and I don't have a credit card verified account to use Redis add-on. Also, uploading portfolio image feature, because I don't have a Amazon S3 account for the same reason, and Heroku doesn't support file uploading.

## Run locally
#### Step 1: Clone repo
```bash
git clone https://github.com/52/dissect.git
cd dissect
```
#### Step 2: Install gems and setup db
Note: The ruby version specified on the first line in `Gemfile` is required when deploying to Heroku. You may want to delete that line or change it to your ruby version.  
```bash
bin\bundle
bin\rails db:create
bin\rails db:setup
```
#### Step 3: Add secret key base
`Devise` requires a `secret_key_base` for generating account confirmation, password reseting token.  
`secret_key_base` is stored in `config/secrets.yml` file:
```
development:
  secret_key_base: enter_your_development_secret_key_here

test:
  secret_key_base: enter_your_test_secret_key_here

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```
You can generate a random secret key by running `bin\rails secret`
#### Step 4: Specify enviroment variables
This app have a feature that requires Twitter API. Get your [Twitter API keys](https://apps.twitter.com/), create a file named `.env`, and save your key into it like this
```
TWITTER_CONSUMER_KEY=enter_your_hey_here
TWITTER_CONSUMER_SECRET=enter_your_hey_here
TWITTER_ACCESS_TOKEN=enter_your_hey_here
TWITTER_ACCESS_SECRET=enter_your_hey_here
``` 
#### Step 5: Start server
```
bin\rails s
```

## Built with
- Rails version 5.1.5
- Ruby version 2.4.3
_______
[Course's author repo](https://github.com/jordanhudgens/devcamp-portfolio)
