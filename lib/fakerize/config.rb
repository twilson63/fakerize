require 'yaml'

module Fakerize
  module Config
    extend self

    def load(filename)
      result = YAML.load_file(filename)
      raise "Invalid Config" if result[:models] == nil
      result
    end
  end
end
