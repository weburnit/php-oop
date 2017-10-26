# Interviewee Notes
When it comes to micro-services, Lazada Group has a lot of experience according to
our sophisticated system regarding e-Commerce platform.

We have applied so many frameworks through our project such as Zend 1,2, Symfony 2/3, Lumen, Go-Framework and Django as well.

Lumen is one of the most tiny and robust due to its simplistic which is awesome for any high-traffic service.

At Lazada, there's one Symfony 2.8 project which is migrated to micro-service approach based on Lumen.
These are benefit we consider to choose Lumen:
- Test Driven Development on Lumen is easy to applied to reflect our Business Logic, especially for Ecommerce Platform
- Test Environment is completely lightweight and robust either Unit and Functional Test.
- Lumen is closed to Pure PHP without any heavy concept compare to Bundle in Symfony.
- Easy to integrate any pure-php library
- Design Pattern on Lumen is straightforward to apply. Because our system has to integrate with so many 3rd party platform.

## Finished:

**NOTE:** You are free to use any framework you wish. Bonus points for an explanation of your choice.

1. Command line: `php artisan bank:process`

2. Run Docker for this project `docker-composer up -d`

3. Add new host to your `/etc/hosts` for `lumen.local`

4. Access Local by `lumen.local`

5. All Test are implemented in `/tests`
   
## Approach

- TDD
- DDD
- OOP
- Docker