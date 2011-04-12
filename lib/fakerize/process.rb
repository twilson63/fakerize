
# Fakerize
#
# Example
#
# data = { :last_name => 'Rocket'}
# options = [{ :field => :last_name, :fakerize => 'Faker::Name.first_name' }]
#
# Fakerize(data, options) #=> { :last_name => 'FakerizedData' }
#


module Fakerize
  module Process
    extend self

    def run(data, options)

      options.each do |option|
        data[option[:field]] = eval(option[:fakerize])
      end
      data
    end
  end
end