module Fakerize
  module Data
    class Sequel < Base

      def initialize(source)
        @db = ::Sequel.connect(source)
      end

      def models
        @db.tables
      end

      def records(table)
        @db[table].all
      end

      def update(table, record)
        @db[table].where(:id => record[:id]).update(record)
      end

    end
  end
end
