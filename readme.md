# Fakerize

A CLI that allows you to de-identify data in your database.

    gem install fakerize
    # create a config file
    # run
    fakerize database:convert mysql://user@localhost/mydb myconfig.yml


## Why

We needed a way to quickly generate a demo system that has some real
data, but in a way that provided a complete de-identification of people
in our database.  We wanted to make the process extensible and re-usable
so that we can use for our future data stores.



## Config File

Using a yaml config file that contians a list of tables
within each table a list of fields to fakerize, then on each field it
contains the Faker Class and Method that needs to be called.

Here is an example:

    ---
    models:
      - 
        :name: :patients
        :options:
        - 
          :field: :last_name
          :fakerize: Name.last_name
        -
          :field: :first_name
          :fakerize: Name.first_name
        -
          :field: :ssn
          :fakerize: Ssn.en_ssn
        -
          :field: :dob
          :fakerize: Patient.dob
        - 
          :field: :phone
          :fakerize: Patient.phone

## Command Line

    Just pass the Sequel Connection string

    fakerize database:convert mysql://root@localhost/mydb my_config.yml
    

## Requirements

* Ruby 1.9.2
* Faker Gem
* Sequel Gem
* MySql Gem


## ToDos

* Setup Gemspec file
* Add Plugin System to make the data modules datastore agnostic
* Add a database clean functionality to remove data




