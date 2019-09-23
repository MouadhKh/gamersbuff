# Web Development Project of Mouadh Khlifi
# Project name: Gamersbuff
# Project deployed to : www.gamersbuff.com

## Getting started
To get started with the app, clone the repo and go the "gamerbufff" folder

# Git Repository:
https://github.com/MouadhKh/gamersbuff.git

then install the needed gems:

$ bundle install 

Next, migrate the database:

$ rails db:migrate

Finally, run the test suite to verify that everything
is working correctly:

$ rails test

If the test suite passes, you'll be ready to run the
app in a local server(See Required Configuration ):

#  Run:
$ rails s

# Required Configuration
- Use Google reCAPTCHA keys in initializers/recaptcha.rb
- Production:<br>
    - Configure mailer in production.rb
    - Configure AWS S3 in production.rb & storage.yml

# Implemented Features :
* Member Registration/Login
* User Profile: Email & Password : Editable , Uploaded Plays : Displayed & Destroyable ( only if the user is the plays ' owner  or user is an admin) 
* Add Play with its parameters(Title,Game name etc...) 
* Users can rate plays ( => can compete to be at the top of Top Plays table ) 
* Top Plays show a ranking of most voted Plays 
* Contact us : allow user ( member or non member ) to contact the admin 
          -Protected by reCAPTCHA to avoid flooding
          
# Possible improvements : 
- Add Gifting System to make getting the most voted play a challenge 
- Implement a mechanism to make a Username verification to make sure the uploaded plays belongs to the uploader and aren't just stolen from somewhere in the internet
- Support more games
- Optimize Navigation 


