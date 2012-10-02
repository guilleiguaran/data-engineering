# LivingSocial Engineering Challange

## Getting Started

To run the application is necessary install Ruby 1.9, some of the
dependencies of the project (like Puma and GirlFriday) don't work
fine in Ruby 1.8 (MRI) because of its poor threading support.

You should install the gem dependencies of the project with Bundler:

    bundle install

And later you should create database and run migrations:

    rake db:create
    rake db:migrate


## Running Application

The application is a standard Rails app and can be started with:

    rails s puma


## Running tests

The application contains a basic test suite based in minitest you can
run it with rake:

    rake test
