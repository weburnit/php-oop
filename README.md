# Basic PHP and Symfony 2.8 interview

Dear candidate, please follow this readme and solve all questions.

> Before you can start, you should prepare your development environemt.

**Using Symfony with Homestead/Vagrant**

In order to develop a Symfony application, you might want to use a virtual development environment instead of the built-in server or WAMP/LAMP. Homestead is an easy-to-use Vagrant box to get a virtual environment up and running quickly.

Before you can use Homestead, you need to install and configure Vagrant and Homestead as explained in the Homestead documentation.

Resources:
- [Using Symfony with Homestead/Vagrant](http://symfony.com/doc/current/cookbook/workflow/homestead.html)
- [Homestead documentation](http://laravel.com/docs/homestead#installation-and-setup)


**This test requires:**
- Access to the internet
- Best an php IDE
- Working setup of PHP 5.6+ *(http://symfony.com/doc/current/reference/requirements.html)*
- Composer *(https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx)*
- MongoDB *(https://docs.mongodb.com/manual/installation/)*
- Nginx or alternative simple web server


*Help: PHP 5.6+ (debian/ubuntu)*
> sudo apt-get install -qq php5-cli php5-fpm php5-mysqlnd php5-curl php5-gd php5-json php5-redis php5-imap php5-intl php5-imagick php5-mcrypt php5-xdebug php5-xmlrpc php5-xsl php5-twig php5-mongo php5-dev

*Help: (optional) PECL MongoDB library*
> sudo apt-get install pkg-config libssl-dev
> sudo pecl update-channels && sudo pecl install mongodb

*Help: Clone the [test repository](https://github.com/OskHa/php_interview_test) and make sure its working.*
Access the project with your favourite browser. You should see similar welcome screen.  
![Symfony welcome screen](https://raw.githubusercontent.com/OskHa/php_interview_test/master/symfony_screenshot.png)

**Good luck!**


--------


### Test tasks:

1. Change the text on symfony homepage from "Welcome to Symfony 2.8.8" to "Welcome to McMakler"

1. Run the PhpUnit test. Check if there are any errors, if so fix them.

1. Create a new Bundle "McMaklerTest" within the namespace "McMakler"

1. Go to app/config/config.yml and add the following yaml structure. Replace the (vars) with whatever you want

  ```
  mcmakler_test:
    first_name: (my first name)
    last_name: (my last name)
    ping: pong
  ```

1. Check the symfony application for errors and fix them if any.
1. Create a controller with a json return `{"hello":"world!"}`
1. Load the MongoDB dump ...
1. Define document, repository for the mongodb collection
1. implement some method
1. Create a service that retrieves the db value and logs errors/misses...
1. Create another controller taht returns some value from db
1. make a unit test for the controller
  * check if hello controller is 200
  * check if hello controller response is json
  * check if db controller response is 200 with proper id
  * check if db controller response is 401 with bad id
  * check if db controller response is 401 with bad id
  
1. make a unit test for the db service
  * check response for proper id
  * check response for bad id

1. write a command called "mcmakler:test" that should accept 1 argument called id
1. write a prompt for the command "mcmakler:test"
1. after propmt is declined, write in red "not ok"
1. after propmt is accept use your service to retrieve the document by id and return it as json


