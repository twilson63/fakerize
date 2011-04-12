# Fakerize

The purpose of this project is to de-identify any sensitive data in a
database, but still render it useful for creating and deploying a demo
system.  

## Input

The input is a simple yaml config file that contians a list of tables
within each table a list of fields to fakerize, then on each field it
contains the Faker Class and Method that needs to be called.


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
          :field: ssn
          :value: Patient.ssn

## Command Line

    Just pass the Sequel Connection string

    fakerize database:convert mysql://root@localhost/mydb my_config.yml
    

## Requirements

* Ruby 1.9.2
* Faker Gem
* Faker Medical Gem
* Sequel Gem
* MySql Gem


## ToDos

* Setup Project
* Fakerize Class

Fakerize Class takes an array and a config file as inputs, then it loops
thru the array and finds all the hash attributes and runs fakerize on
them.


config = YAML::Load_file('config')
config[:models].each do |model|
  fakerize_options = model[:options]
  db[model[:name]].each do |record|
    fakerized_data = Fakerize.process(record, fakerize_options)
    record.update_attributes(fakerized_data)
  end
end
####
create a simple module that takes a set options and a hash then returns
a fakerized hash.
####



