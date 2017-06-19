# Basic PHP and Symfony 2.8 interview

Dear candidate, please follow this readme and solve all questions.

> Before you can start, you should prepare your development environment.

**Using Symfony with Homestead/Vagrant**

In order to develop a Symfony application, you might want to use a virtual development environment instead of the built-in server or WAMP/LAMP. Homestead is an easy-to-use Vagrant box to get a virtual environment up and running quickly.

Before you can use Homestead, you need to install and configure Vagrant and Homestead as explained in the Homestead documentation.

Resources:
- [Using Symfony with Homestead/Vagrant](http://symfony.com/doc/current/cookbook/workflow/homestead.html)
- [Homestead documentation](http://laravel.com/docs/homestead#installation-and-setup)


**This test requires:**
- access to the internet
- php capable IDE (we suggest PhpStorm with symfony, yaml, twig and php annotations plugin)
- working setup of PHP 5.6 *(http://symfony.com/doc/current/reference/requirements.html)*
- Doctrine ODM is not compatible with PHP 7.0
- composer *(https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx)*
- mongoDB *(https://docs.mongodb.com/manual/installation/)*
- nginx or alternative simple web server

*Tip: Install Robomongo on your OS*

*Tip: Clone the test repository and make sure it's working.*
Access the project with your favourite browser. You should see similar welcome screen. **Dont forget to run composer install.**
![Symfony welcome screen](https://raw.githubusercontent.com/OskHa/php_interview_test/master/symfony_screenshot.png)

*Help: PHP 5.6+ (debian/ubuntu)*
> sudo apt-get install -qq php5-cli php5-fpm php5-mysqlnd php5-curl php5-gd php5-json php5-redis php5-imap php5-intl php5-imagick php5-mcrypt php5-xdebug php5-xmlrpc php5-xsl php5-twig php5-mongo php5-dev

*Help: (optional) PECL MongoDB library (debian/ubuntu)*
> sudo apt-get install pkg-config libssl-dev && sudo pecl update-channels && sudo pecl install mongodb

**Good luck!**


--------


**Before you start**
- usage of Guzzle is allowed
- you can extend composer.json / add own libraries
- try to follow SOLID and DRY concepts


## Test tasks:


1. Create a new Bundle "NasaBundle" within the namespace "Neo"

1. Create a default controller with a method helloAction 
  * under `Nasa` namespace
  * for route `/`
  * with a proper json return `{"hello":"world!"}`

1. Use the api.nasa.gov
  * the API-KEY is `N7LkblDsc5aen05FJqBQ8wU4qSdmsftwJagVK7UD`
  * documentation: https://api.nasa.gov/neo/?api_key=N7LkblDsc5aen05FJqBQ8wU4qSdmsftwJagVK7UD
  
1. Write a command
  * to request the data from the last 3 days from nasa api
  * response contains count of NEOs
  * persist the values in your DB (mongoDB)
  * Define the document as follows:
    * date
    * reference (neo_reference_id)
    * name
    * speed (kilometers_per_hour)
    * is hazardous (is_potentially_hazardous_asteroid)

1. Create a route `/neo/hazardous`
  * display all DB documents which contain potentially hazardous asteroids
  * format JSON

1. Create a route `/neo/fastest`
  * display a DB document data with the fastest asteroid
  * format JSON
  
1. Test your application



## Bonus tasks

1. Consider the following code
  ```
  $str1 = 'foobardoo';
  $str2 = 'foo';
  if (strpos($str1, $str2)) {
      echo "\"" . $str1 . "\" contains \"" . $str2 . "\"";
  } else {
      echo "\"" . $str1 . "\" does not contain \"" . $str2 . "\"";
  }
  ```
  
  The output will be:
  
  `"foobardoo" does not contain "foo"`
  
  **Why? How can this code be fixed to work correctly?**
  
  *Save your solution under `bonusTasksSolutions.php`*
  
1. How many elements contains the $_POST data after executing this request and why?
  
  ```
  // JavaScript, jQuery
  $.ajax({
      url: 'http://my.site/some/path',
      method: 'post',
      data: JSON.stringify({a: 'a', b: 'b'}),
      contentType: 'application/json'
  });
  ```
  
  *Save your solution under `bonusTasksSolutions.php`*
  
1. Solve the statement. Write down your solution.
  
  ```
  A bread with butter cost 1.10 €. The bread is 1€ more expensive then the butter. How much does the butter cost?
  ```
  
  *Save your solution under `bonusTasksSolutions.php`*

1. Go to app/config/config.yml and add the following yaml structure. **(NOTICE: ping is a child-key of test)**
  ```
  test:
    ping: pong
  ```

1. write a command called `test:command` which accepts 1 argument `id`
  * The command should check if a document with an id of the argument exists
  * if document exists, return info "document exists"
  * if document doesn't exist, return error "document doesn't exist"
  * Add a propmpt for your command. Prompt text is "This is a test. Do you want to continue (y/N) ?"
  * If you decline, return error "Nothing done. Exiting..."
  * If you accept, run the command


# That's it!
## Thank you for your participation! Good luck submitting your results!
