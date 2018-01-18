This application is built using Ember.js and Ruby on Rails.

PreRequsites to run the project:
1. Install homebrew: https://brew.sh/
2. Install rbenv: brew install rbenv
3. Install ruby 2.5.0: rbenv install 2.5.0
4. Make this default ruby version: rbenv global 2.5.0
5. Install rails: gem install rails
6. Install node js: https://nodejs.org/en/
7. Install Bundler: gem install bundler
8. Install Ember-cli: npm install -g ember-cli
9. Install postgresql: brew install postgresql
10. Run postgresql: brew services start postgresql

Setup instructions:
1. Clone the github project.
2. bundle install
2. rake db:create
3. rake db:migrate
4. rake db:seed
5. cd frontend
6. npm install
7. rails s

Database:
Name: instacart-shopper_development
Tables: applicants and shoppers

Visit localhost:3000 - It could take a minute

Common errors:
1. get binding error for node-sass
	Solution: 	cd frontend
				npm rebuild node-sass

2. ActionView::Template::Error (:frontend has failed to build: 2018-01-17 17:41 ember[799](FSEvents.framework) FSEventStreamStart: register_with_server: ERROR: f2d_register_rpc() => (null) (-21)
	Solution: Restart machine


Part 1:
1. The solution is built using Ember and Ruby on Rails. I used Ember Data, its store capabilites integrates really well with Ruby on Rails.
2. I spent a lot of time on design and UI, UX to make it look good with a clear call to action on the landing page and a very simple and easy-to-use UX.
3. It addresses all the functionalites mentioned in the requirements.
4. I also perissted the data in the database instead of only outputting to the console.
5. Bonus tip: Since I'm really passionate about growth and A/B testing, I developed a simple A/B test using Optimizely that changes the landing page call to action to help improve conversion. It isn't the best test or functionality, but a little preview due to time limitations.
	To activate the A/B test, just click on the copyright logo at the bottom of the page and reload your page. 
	Ideally, this would happen automatically based on what bucket you fall into(control or variant) but this is just for demonstration purposes.
	To remove yourself from the test, delete the cookie I set called instacookie from your browser.


Part 2:
1. Unfortunately, I am not very experienced with sql and db using command line or bash scripts. I was not sure how to go about writing this part of the challenge and I could not manipulate the sqlite database using terminal or the script but I was able to view it using a third party tool to extract the different workflow_states.
2. However, I have some experience with ruby on rails and I was able to do the same thing using this. I have created an endpoint that takes in start_date and end_date and returns a JSON response.
3. When you ran rake:db seed, I populated the db with 1000 entries of random data using faker. It has a random workflow_state and dates between 2018-01-01 and 2018-01-31. This can be changed and you can seed the database again.
Commands:
	rake db:migrate:reset
	rake db:seed
4. I have followed the exact same requirements as mentioned. I have also used api versioning. 
5. Sample url: http://localhost:3000/api/v1/applicants?start_date=2018-01-01&end_date=2018-01-31

Note:
I have not done any testing for Part 2 - Any date validation, etc.

Things to do if I had more time:
1. Testing for Part 2 - rspec
2. Better implementation and design for both parts.
3. Add caching to improve performance


Please let me know if you have any questions!

