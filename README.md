# StreamFinder

StreamFinder is an application geared towards environmental consultants and scientists looking to find water quality monitoring stations throughout Colorado.  The monitoring station data is retrieved from the Water Quality Portal Web Service and made available in an easy to navigate map interface.  Due to heroku record limitations, monitoring stations within the Colorado front range (Colorado Springs to Fort Collins) are the only stations stored within the postgresql database.  This database is refreshed weekly by a background worker.  If the user performs a search for stations outside of this range, an api call is made.  

The map interface was built using the Mapbox GL JS library, and allows users to search for monitoring stations based on watershed, type of station, county, or by a particluar station id.  I plan to build on this to allow users to search by drainage area, a common characterstic used by water resource engineers to find reference reaches for stream restoration projects.  Users can view stream discharge from the past 24 hours for a particular stream station.  I would like to add another feature that allows users to query historical data for a particular station and have it retrieved as a csv.  

See the deployed project here: [StreamFinder](https://still-reef-30303.herokuapp.com/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

1. clone down this project and change into the directory
```
git clone https://github.com/amj133/stream-finder
bundle install
```
2. create and migrate the database
```
rake db:create
rake db:migrate
```
3. Run rails server and visit localhost:3000 in your browser
```
rails s
```
*visit http://localhost:3000 in your browser
*enjoy!

### Prerequisites

* Ruby 2.4+
* Rails 5

## Running the tests

To run the tests, follow the instructions in [Getting Started](#getting-started) above first.  Open the project directory then run rspec.
```
rspec
```
##### Tests include: 
* feature tests for logging in, creating and editing projects, and adding monitoring stations to a project
* model tests of all ActiveRecord and PORO models
* service tests of all PORO services
* request tests of all API request endpoints

##### Tools and gems used for testing:
* [capybara](https://github.com/teamcapybara/capybara)
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)


## Contributing

Feel free to make pull requests or comments to contribute to this application. I am happy to receive your feedback!

## Authors

* [Andrew Jeffery](https://github.com/amj133)

## Acknowledgments

* Thank you to our awesome instructors at Turing for help and guidance during this project!
