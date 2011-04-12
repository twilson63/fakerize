# require 'helpers'
# require 'plugin'

require_relative 'commands/base'
Dir["#{File.dirname(__FILE__)}/commands/*"].each { |c| require c }

module Fakerize
  module Command
    class InvalidCommand < RuntimeError; end
    class CommandFailed  < RuntimeError; end

    class << self
      def run(command, args=[])
        #Fakerize::Plugin.load!
        run_internal(command, args)
      end

      def error(msg)
        STDERR.puts(msg)
        exit 1
      end


    private
      def run_internal(command, args)
        klass, method = parse(command)
        runner = klass.new(args)
        raise InvalidCommand unless runner.respond_to?(method)
        runner.send(method)
      end

      def parse(command)
        parts = command.split(':')
        return Fakerize::Command.const_get(parts.first.capitalize), parts.last
      end

    end
  end
end
