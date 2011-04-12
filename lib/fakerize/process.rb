
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
        cmd = build_faker_command(option[:fakerize])
        data[option[:field]] = eval(cmd)
      end
      data
    end


    def build_faker_command(command)
      ['Faker', command].join('::')
    end

  end
end
