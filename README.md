# LogParserChallenge

  Challenge done during the second week of the Codeminer42 trainee program.

## Installing Ruby Language

  * First of all, install `rvm` in your machine. [Here](https://github.com/rvm/ubuntu_rvm) is a guide to install it on Ubuntu.
  * With `rvm` installed, use it to install `Ruby 3.1.0`:
  * Run ```rvm install ruby 3.1.0``` in your terminal and you should be fine.

## Cloning this repository
  
  * In your terminal, run `git clone https://github.com/jesrodri/LogParserChallenge.git`  
    * Make sure you are on the desired directory.
  
## Installing RSpec to run the tests

  * Inside the project's directory, run `bundle init` in your terminal in order to generate a Gemfile.
  * Go into the `Gemfile` and add the RSpec gem to it by typing `gem 'rspec', '~>3.0'` in a new line.
    * Don't forget to **save the file**!
  * In your terminal, run `bundle binstubs rspec-core`
  * Run `bin/rspec --init`

## Executing the application

  * Place the log file in the root of the repository.
  * Run `ruby main.rb`

## Executing the tests

  * Run `bin/rspec`
