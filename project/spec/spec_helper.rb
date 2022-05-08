ENV["APP_ENV"] = "test"



# load the app

require_relative "../main"



# Configure RSpec and Capybara

require "rack/test"

require "capybara/rspec"

Capybara.app = Sinatra::Application

def app

 Sinatra::Application

end

RSpec.configure do |config|

 config.include Capybara::DSL

 config.include Rack::Test::Methods

end
require "simplecov"
SimpleCov.start do
    add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

require "simplecov"

SimpleCov.start do

  add_filter "/spec/"

end

SimpleCov.coverage_dir "coverage"



#add a test mentee

def add_test_mentee


  visit "/signupmentee"

  fill_in "first-name", with: "Mentee"

  fill_in "surname", with: "Test"

  fill_in "username", with: "TestMentee"

  fill_in "password", with: "TMent1"

  fill_in "email", with: "TestMentee@sheffield.ac.uk"

  fill_in "university", with: "University of Sheffield"

  fill_in "field", with: "Computer Science"

  click_button "Submit"

end



#add a test mentor

def add_test_mentor

  visit "/signupmentor"

  fill_in "first-name", with: "Mentor"

  fill_in "surname", with: "Test"

  fill_in "username", with: "TestMentor"

  fill_in "password", with: "TMent1"

  fill_in "email", with: "TestMentor@sheffield.ac.uk"

#should be company description, not university

  fill_in "university", with: "Example company description"

  fill_in "field", with: "Computer Science"

  click_button "Submit"

end



# clear out the database

def clear_database

 DB.from("Users").delete

end



# ensure we're always starting from a clean database

clear_database
