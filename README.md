# README

Journal App was created as part of technical training at Solirius Consulting in March 2023

* Runs on Ruby version 3.2.0 and Rails 7.0.4.2
* Automation tests use Cucumber 8.0.0, Capybara and Selenium's Chrome webdrivers


To run the app from an IDE, execute in order
1) > `rails db:migrate`

2) > `bundle install`
    
3) > `rails server` 
   
To run automation tests, the application must be running in a server by calling `rails server` 

Run all automation tests in parallel:
>  `parallel_cucumber features -o"-f pretty --publish-quiet`

Run all automation tests in series:
> `cucumber features` 