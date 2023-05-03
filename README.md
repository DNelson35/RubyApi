# Ruby API

This Ruby Api is used to manage and provide data for a my react front-end application [here](https://github.com/DNelson35/phase-3-project). The application uses Sinatra and Active Record. All photos for the seed data in this application are sourced from the unsplash library [here](https://unsplash.com/)

## Sinatra

Since Sinatra inherits from Rack, Sinatra is allowing our application to receive http requests and send a response back. For this application Sinatra is making it easier to use and define `Get`, `Patch`, `Post`, `Put`, and `Delete` actions in the controller, as well as send back the response with the default header 'Content-Type: application/json'. To describe this when an fetch is made from the frontend to the server, rack is hosting our server at "https://localhost:9292" when the server receives the request from the frontend Sinatra will then take the endpoint and match it to an action inside the application controller. that action is then executed and a response is sent back to the frontend with the default header 'Content-Type: application/json'. Sinatra also provides us with the Params hash that allows us to use key/value pairs in the url, for example:

```ruby
  delete '/companies/:company_id/drinks/:id' do
    company = Company.find(params[:company_id])
    drink = company.drinks.find(params[:id])
    drink.destroy
  end
```

in this example params will be a hash containing the keys of company_id and id so if our server receives a request to this action like this "http://localhost:9292/companies/1/drinks/2" then sinatra will pass /companies/1/drinks/2 to the action that matches the URI and the Method sent in the request. In this case if the Fetch sent a Delete request to this url then the delete action will be executed and params will look like this:

```ruby
{
  "company_id": "1",
  "id": "2"
}
```

When the the action is executed `params[:company_id]` will be 1 and `params[:id]` will be 2. The find will then look for a company with the ID of 1 and and a drink related to the company with the ID of 2. the company.drink will then be set to drink variable and drink.destroy will delete the record.

## Active Record

Active Record is a Ruby gem that provides an Object-Relational Mapping (ORM) framework for our application. It simplifies the task of communicating with the database by allowing us to interact with the database using Ruby objects. In this application, we use Active Record to define the structure and relationships of our database tables.

Active Record provides several features that make it easier to work with our database, including:

### Migrations:

 Active Record provides a simple way to define changes to our database schema over time, allowing us to easily create and modify database tables, columns, and relationships. In this application we use migrations to create both the companies and drinks tables. 

### Associations:

 Active Record allows us to define associations between our database tables, such as one-to-one, one-to-many, and many-to-many relationships. These associations make it easier to fetch and manipulate related records in our application. For this application we have a one-to-many relationship between our database tables. Company has many Drinks.

### Validations:

 Active Record provides a set of validation helpers that allow us to define rules for how data should be stored in our database. These validations help ensure data integrity and prevent invalid data from being stored. Validations can be used to make sure data received meets certain requirements.

### Query interface:
 Active Record provides a simple and powerful query interface for interacting with our database. This interface allows us to fetch records based on specific criteria, and provides a wide range of options for sorting, filtering, and aggregating data. some of the methods provided in this application are `all`, `find`, `create`, and `destroy`. There are many more methods provided by Active Record for more information click [here](https://guides.rubyonrails.org/active_record_querying.html) 

In this application, we use Active Record to define the schema and associations for our companies and drinks tables, and to perform queries and updates to the database. Active record allows us to write cleaner more abstracted code that is easier to read and write for managing and retrieving data from our database.

# How it works

## config folder
The config folder contains two files the database.yml and the environment.rb files. 

### database.yml
The database.yml file is used to define the database configurations for different environments (such as development, test, production). 

### environment.rb
the environment file sets RACK_ENV to development by default. Then uses Bundler.require to get all the gems from the gem folder as well as the development group. one of these gems is The sinatra-activerecord gem which loads the database.yml file that sets up the database connection settings. which in this case is development. Next the environment file brings in all files inside the app folder. which will be the controller and  the models

## Config.ru file
the config.ru file is used to first to brink it all the environment file then Allow CORS (Cross-Origin Resource Sharing) requests and specifies which request we allow and where we allow the request to come from. Next we use Rack::JSONBodyParser to parse the body of the request so that we can use the json data from the request and example would be: 

```ruby
 post '/companies' do
    new_company = Company.create(
      name: params[:name], # => the params[:name], :name comes from the body of the request
      logo_url: params[:logo_url]
    )
    new_company.to_json(include: :drinks)
  end
```

This allows us to pull information from the body of the request using the keys from the json object.

Then finally for the config.ru file we run the ApplicationController which gives us access to the actions and logic used inside the ApplicationController and tells Rack to use this as the point for handling request.

## Rakefile

In the Rakefile we require_relative "./config/environment" and
require "sinatra/activerecord/rake". the relative file is our environment file which sets our environment by default to development, brings in all dependencies as well as the dependency group under development, and application files. While the  require adds several Rake tasks to your application that make it easy to manage database schema changes and perform common database operations such as seeding data or resetting the database. Inside the Rakefile we define some rake tasks.

### Rake

Rake is a build automation tool for Ruby that provides a domain-specific language (DSL) for defining and running tasks. Rake tasks can be used to automate common development tasks such as running tests, deploying code, or managing database migrations.

### server task

Inside the server task we first check if the database has any pending migrations if it does a message is put to the console and the task exits. if no pending migrations exist then ENV["PORT"] is set to 9292 if the Port environment variable hasn't been set to a different value. then the variable rackup is set to rackup = "rackup -p #{ENV['PORT']}" which is used to run the config.ru file that runs the sever the sever will be ran at the port specified before. The next line then executes  "bundle exec rerun -b '#{rackup}'" which will run the server at the port specified and any time a file is changed the server will be restarted. 

### console task

Inside the console task we set the logger for Active Record to a new instance of the Logger class that logs to standard output (STDOUT). This will cause Active Record to output SQL statements and other debugging information to the console. then we start the console using the Pry gem. By starting a console with Pry, we can interact with your application's database using the Active Record ORM and run Ruby code to explore and manipulate the data.

# Putting it simply

When a request is made to the application, the Rack server is instructed to use the application controller to handle the request, thanks to the configuration in the config.ru file. The application controller is contained within the app directory, which is required by the environment file, giving the config.ru and Rakefile access to it. When the Rack server is started with rackup, it sets up both the server and the database, as specified in the environment file.

When the request from the frontend arrives, the application controller identifies the corresponding action to run. It then accesses the necessary data by using classes from the models directory, which have been granted access to the data through ActiveRecord::Base. This means that the application controller does not access the database directly, but rather through the models. Once the data has been retrieved, it can be processed and returned to the frontend as a response.
