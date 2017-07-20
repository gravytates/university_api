# _University API_

#### _This is a API Application built using Ruby on Rails.  July 14, 2017_

#### By _**Asia Kane and Grady Shelton**_

## Description

This is an API that includes data for Universities and their Reviews.  It includes Authentication using Devise and JWT tokens.  It also features Pagination and Serialization to return reviews nested within universities.  It includes multiple scopes listed below.

Users can access:
- GET requests for universities and reviews

Authenticated users can access:
- POST, PATCH, PUT, DELETE requests for universities and reviews

Scopes:
- Filters universities by name
- Filters universities by description
- Filters universities by population
- Filters universities by mascot

The application structure is outlined below.  

Models:
  - Universities
  - Reviews
  - Users (Devise Authentication)

## Database Seeding

The application is seeded using `faker`.  It seeds 20 universities and 1 review for each university.

There is one user seeded in the database with Email: "a@a.com", Password: "111111".

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](https://git-scm.com/)
* [Postgres](https://www.postgresql.org/)
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* [Rails](http://rubyonrails.org/)

## Installation

In your terminal:
* `git clone https://github.com/akane0915/university_api`
* `cd university_api`
* `bundle install`
* Open another terminal window and type `postgres`.  Leave this window open.
* In your first terminal window type:
* `bundle exec rake db:setup`
* `bundle exec rake db:test:prepare`

This application uses JWT Tokens.  To configure, you must authenticate the seeded user to generate a token.  In your terminal, run:

`curl -X POST -d email="a@a.com" -d password="111111" http://localhost:3000/auth_user`

You can test the API in Postman.

* URL: localhost:3000/
* Header Key: Authorization
* Header Value: 'your-own-token-goes-here'

## Calling API from another application
You can test API calls from your own application via the Rails Console.  See sample commands below for GET, PATCH, POST, and DELETE.

### University Calls

`JSON.parse(RestClient.get 'http://localhost:3000/universities')`

`JSON.parse(RestClient.patch 'http://localhost:3000/universities/1', {name: 'updated', description: 'desc', population: 2000, mascot: 'manbearpig'}, headers={authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.MiSLJdKnnL-RB1pbM4VyqRzr629ojXQ0sXCSnWjcvI0'})`

`JSON.parse(RestClient.post 'http://localhost:3000/universities', {name: 'uni', description: 'desc', population: 2000, mascot: 'manbearpig'}, headers={authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.MiSLJdKnnL-RB1pbM4VyqRzr629ojXQ0sXCSnWjcvI0'})`

`JSON.parse(RestClient.delete 'http://localhost:3000/universities/1', headers={authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.MiSLJdKnnL-RB1pbM4VyqRzr629ojXQ0sXCSnWjcvI0'})`

### Review Calls

`JSON.parse(RestClient.get 'http://localhost:3000/universities/1/reviews/1')`

`JSON.parse(RestClient.patch 'http://localhost:3000/universities/1/reviews/1', {author: 'updated-author'}, headers={authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.MiSLJdKnnL-RB1pbM4VyqRzr629ojXQ0sXCSnWjcvI0'})`

`JSON.parse(RestClient.post 'http://localhost:3000/universities/1/reviews', {author: 'Mr. NiceGuy, No-Mo', content: 'not the best school.', rating: 2 }, headers={authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.MiSLJdKnnL-RB1pbM4VyqRzr629ojXQ0sXCSnWjcvI0'})`

`JSON.parse(RestClient.delete 'http://localhost:3000/universities/1/reviews/1', headers={authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.MiSLJdKnnL-RB1pbM4VyqRzr629ojXQ0sXCSnWjcvI0'})`


## Development server

Run `bundle exec rails s` for a dev server. Navigate to `http://localhost:3000/`. The app will automatically reload if you change any of the source files.

* If you would like to make changes to this project, do so in a text editor.
* Make frequent commits with detailed comments.
* Submit changes as pull request to Asia at akane0915 on Github.

## Running tests

This app uses RSpec and Shouldamatchers for testing.
Run `bundle exec rspec` in terminal to test.

## Technologies Used

* Ruby
* Rails
* JWT Gem
* Devise
* ActiveRecord
* Postgres
* Bundler
* Rake Gem
* HTML
* CSS
* Bootstrap
* ES6

## Known Bugs
_N/A_

## Support and contact details
_I encourage you to update/make suggestions/refactor this code as you see fit. I am always open to improvement! Please contact Asia Kane at asialkane@gmail.com with questions._

### License
*This software is licensed under the MIT license*
Copyright © 2017 **Asia Kane and Grady Shelton**
