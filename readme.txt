NWPU LIB System

An automated system to manage Library services of a good size library.

The backend of the system is developed on Laravel 4.2 PHP MVC Framework

The front end is built on Edmin Responsive Bootstrap Admin Template (Demo) which is built on Bootstrap v2.2.2 using jQuery and Underscore-Dot-JS

Features

Librarians can be given their authorized login ID and password without which system can not be accessed. 

Students can access only limited features, i.e., public access level features which include searching a book and student registration form  

After logging in librarians can search for a book, book issue or a student from home panel itself   

Librarians need to make an entry for new books, to automate the process they simply need to enter the number of issues and the Issue ID for each book issue would generate automatically 

Another responsibility of a librarian is to make approve students because the documents are to verified (or some manual work) so they have a panel to simply approve / reject students and to view all approved students. The librarian ID also gets stored along with each approved/rejected student to keep a track for future.  

The most important feature for any library is to issue and return books. A panel to view all outstanding logs and a super simple panel to issue and return books for all librarians  

Librarians can scan code,including ISBN, book id,student id. After clicking the input box, the librarian can use a connected bar code scanner to read the code.

Installation

You need to follow the normal lavarel 4.2 installation process.
��https://laravel.com/docs/4.2��

Install Composer

Laravel utilizes Composer to manage its dependencies. First, download a copy of the composer.phar. Once you have the PHAR archive, you can either keep it in your local project directory or move to usr/local/bin to use it globally on your system. On Windows, you can use the Composer Windows installer(https://getcomposer.org/Composer-Setup.exe).

Install Laravel

Via Laravel Installer

First, download the Laravel installer using Composer.

$ composer global require "laravel/installer=~1.1"


Make sure to place the ~/.composer/vendor/bin directory in your PATH so the laravel executable is found when you run the laravel command in your terminal.

Once installed, the simple laravel new command will create a fresh Laravel installation in the directory you specify. For instance, laravel new blog would create a directory named blog containing a fresh Laravel installation with all dependencies installed. This method of installation is much faster than installing via Composer.

Via Composer Create-Project

You may also install Laravel by issuing the Composer create-project command in your terminal:

$ composer create-project laravel/laravel {directory} 4.2 --prefer-dist

Via Download

Once Composer is installed, download the 4.2 version of the Laravel framework and extract its contents into a directory on your server. Next, in the root of your Laravel application, run the php composer.phar install (or composer install) command to install all of the framework's dependencies. This process requires Git to be installed on the server to successfully complete the installation.

If you want to update the Laravel framework, you may issue the php composer.phar update command.


Server Requirements

The Laravel framework has a few system requirements:

- PHP >= 5.4
- MCrypt PHP Extension

As of PHP 5.5, some OS distributions may require you to manually install the PHP JSON extension. When using Ubuntu, this can be done via apt-get install php5-json.


Configuration

The first thing you should do after installing Laravel is set your application key to a random string. If you installed Laravel via Composer, this key has probably already been set for you by the key:generate command. Typically, this string should be 32 characters long. The key can be set in the app.php configuration file. If the application key is not set, your user sessions and other encrypted data will not be secure.

Laravel needs almost no other configuration out of the box. You are free to get started developing! However, you may wish to review the app/config/app.php file and its documentation. It contains several options such as timezone and locale that you may wish to change according to your application.

Once Laravel is installed, you should also configure your local environment. This will allow you to receive detailed error messages when developing on your local machine. By default, detailed error reporting is disabled in your production configuration file.

Note: You should never have app.debug set to true for a production application. Never, ever do it.

Permissions

Laravel may require one set of permissions to be configured: folders within app/storage require write access by the web server.


Paths

Several of the framework directory paths are configurable. To change the location of these directories, check out the bootstrap/paths.php file.


Pretty URLs

Apache

The framework ships with a public/.htaccess file that is used to allow URLs without index.php. If you use Apache to serve your Laravel application, be sure to enable the mod_rewrite module.

If the .htaccess file that ships with Laravel does not work with your Apache installation, try this one:

$ Options +FollowSymLinks
$ RewriteEngine On

$ RewriteCond %{REQUEST_FILENAME} !-d
$ RewriteCond %{REQUEST_FILENAME} !-f
$ RewriteRule ^ index.php [L]

Nginx

On Nginx, the following directive in your site configuration will allow "pretty" URLs:

location / {
    try_files $uri $uri/ /index.php?$query_string;
}


Database Configuration

The database configuration is located at 

app/config/database.php 

file. Open the file with text edit software.

The default database management system is mysql, make sure the mysql software has been installed in your computer.

Find the connection array and config your own database info. For example, as the default database configaration saying:

'mysql' => array(
			'driver'    => 'mysql',
			'host'      => '127.0.0.1',
			'database'  => 'library',
			'username'  => 'root',
			'password'  => 'password',
			'charset'   => 'utf8',
			'collation' => 'utf8_unicode_ci',
			'prefix'    => '',
		),


The database create sql is located at /database/library.sql file. Run this file in your DMS. 

After creating tables, you should migrate the database. Run the following command in your root library management system directory.

$ php artisan migrate

If any exception come out, check your database configuration once again. 

Start running

Set the listening url in the /app/config/app.php here:

'url' => 'http://127.0.0.1:1024/'

Run the following command on your /public directory under library management system directory.

$ php -S 0.0.0.0:1024

If you want to run the server background, run the following command instead:

$ php -S 0.0.0.0:1024 #

Afterwards, type http://127.0.0.1:1024/ in your web browser. Here is your guest index page.

In order to enter the librarian panel, type http://127.0.0.1:1024/sign-in in your web browser.

Now the system is running well.