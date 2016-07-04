# Basic PHP and Symfony 2.8 interview

Dear candidate, please follow this readme and solve all questions.

> Before you can start, you should should prepare your development environemt.

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


## Good luck!


--------


1. Clone the [test repository](https://github.com/OskHa/php_interview_test) and make sure its working. Access the project with your favourite browser. You should see similar welcome screen.  
