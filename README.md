# Basic Backend Developer Interview

Dear candidate, please follow this readme and solve all questions.

> Before you can start, you should prepare your development environment.

**This test requires:**
- access to the internet
- working dev environment (PHP 5.6+ or Node.js 6+)
- database (MongoDB, Postgres, MySQL)
- nginx or alternative simple dev web server

**Good luck!**


--------


## Test tasks:

1. Create a default controller with a method helloAction 
  - for route `/`
  - with a proper json return `{"hello":"world!"}`

2. Use the api.nasa.gov
  - the API-KEY is `N7LkblDsc5aen05FJqBQ8wU4qSdmsftwJagVK7UD`
  - documentation: https://api.nasa.gov/neo/?api_key=N7LkblDsc5aen05FJqBQ8wU4qSdmsftwJagVK7UD
  
3. Write a command
  - to request the data from the last 3 days from nasa api
  - response contains count of NEOs
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

5. Create a route `/neo/fastest`
  - display a DB entry data with the fastest asteroid
  - format JSON
  
6. **NOTE:** You are free to use any framework you wish. Bonus points for an explanation of your choice.
  
## Additional Instructions

Leave comments where you were not sure how to properly proceed.

## Bonus Points

- Test.
- Clean code!
- Knowledge of application flow.
- Knowledge of modern best practices/coding patterns.
- Componential thinking.
- Knowledge of Docker.
- Usage of symfony framework.
- Usage of MongoDB as persistance storage.


# That's it!
Thank you for your participation! Good luck submitting your results!
