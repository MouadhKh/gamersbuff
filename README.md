##Webentwicklung Project of Mouadh Khlifi:
# Project name: Gamersbuff

## Getting started
To get started with the app, clone the repo and go the "gamerbufff" folder

# Git Repository:
"https://github.com/MouadhKh/gamersbuff.git"

#then install the needed gems:

$ bundle install 

Next, migrate the database:

$ rails db:migrate

Finally, run the test suite to verify that everything
is working correctly:

$ rails test

If the test suite passes, you'll be ready to run the
app in a local server(See Required Configuration):

#  Run:
$ rails s

#Required Configuration
Use Google reCAPTCHA keys in initializers/recaptcha.rb
- Production:<br>
    Configure mailer in production.rb
    Configure AWS S3 in production.rb & storage.yml

# Project deployed to heroku : www.gamersbuff.com
