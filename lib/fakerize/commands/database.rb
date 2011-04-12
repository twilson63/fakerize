module Fakerize::Command
  class Database < Base
    class InvalidConfig < RuntimeError; end
    class InvalidData  < RuntimeError; end


    def initialize(args)
      super
      raise InvalidConfig unless @args[1]
      raise InvalidData unless @args[0]

      @config = Fakerize::Config.load(@args[1])
      @data = Fakerize::Data::Sequel.new(@args[0])
    end

    def convert
      @config[:models].each { |config_model| process_model(config_model[:name], config_model[:options]) }
      puts "\nFinished Database...."
      true
    end

    private

    def process_model(name, options)
      @data.records(name).each do |record|
        process_record(record, name, options)
      end
      puts "\nFinished #{name}"
    end

    def process_record(record, name, options)
      fakerized_data = Fakerize::Process.run(record, options)
      @data.update(name, fakerized_data)
      print '.'
    end

  end
end
