# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
WORKFLOW_STATES_ARRAY = [
    "applied",
    "quiz_started",
    "quiz_completed",
    "onboarding_requested",
    "onboarding_completed",
    "hired"
]

#Create 1000 records - this can be changed
#Takes sample from the array
#Creates random date in a one month period
1000.times do
    Applicant.create(workflow_state: WORKFLOW_STATES_ARRAY.sample, created_at: Faker::Time.between(DateTime.new(2018,01,1), DateTime.new(2018,01,31), :all))
  end