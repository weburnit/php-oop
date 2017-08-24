# Basic Backend Developer Interview

Dear candidate, please follow this readme and solve all questions.

> Before you can start, you should prepare your development environment.

**This test requires:**
- access to the internet
- your favourite IDE
- (PHP) working dev environment with PHP 7 and symfony 3.x
- (Node) working dev environment with Node.js LTS
- database (MongoDB, Postgres, MySQL)
- nginx or alternative simple dev web server

**Good luck!**


--------


## Test tasks:

**NOTE:** You are free to use any framework you wish. Bonus points for an explanation of your choice.

1. Specify a default controller
  - for route `/`
  - with a proper json return `{"hello":"world!"}`

2. Use the api.nasa.gov
  - the API-KEY is `N7LkblDsc5aen05FJqBQ8wU4qSdmsftwJagVK7UD`
  - documentation: https://api.nasa.gov/neo/?api_key=N7LkblDsc5aen05FJqBQ8wU4qSdmsftwJagVK7UD
  
3. Write a command
  - to request the data from the last 3 days from nasa api
  - response contains count of Near-Earth Objects (NEOs)
  - persist the values in your DB
  - Define the model as follows:
    - date
    - reference (neo_reference_id)
    - name
    - speed (kilometers_per_hour)
    - is hazardous (is_potentially_hazardous_asteroid)

4. Create a route `/neo/hazardous`
  - display all DB entries which contain potentially hazardous asteroids
  - format JSON

5. Create a route `/neo/fastest?hazardous=(true|false)`
  - analyze all data
  - calculate and return the model of the fastest asteroid
  - with a hazardous parameter, where `true` means `is hazardous`
  - default hazardous value is `false`
  - format JSON

6. Create a route `/neo/best-year?hazardous=(true|false)`
  - analyze all data
  - calculate and return a year with most asteroids
  - with a hazardous parameter, where `true` means `is hazardous`
  - default hazardous value is `false`
  - format JSON

7. Create a route `/neo/best-month?hazardous=(true|false)`
  - analyze all data
  - calculate and return a month with most asteroids (not a month in a year)
  - with a hazardous parameter, where `true` means `is hazardous`
  - default hazardous value is `false`
  - format JSON
   
## Additional Instructions

- Tests are not optional
- (PHP) Symfony is the expected framework
- After you're done, provide us the link to your repository.
- Leave comments where you were not sure how to properly proceed.
- Implementations without a README will be automatically rejected.

## Bonus Points

- Clean code!
- Knowledge of application flow.
- Knowledge of modern best practices/coding patterns.
- Componential thinking.
- Knowledge of Docker.
- Usage of MongoDB as persistance storage.
