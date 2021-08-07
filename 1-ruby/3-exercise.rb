class CsvRow
  attr_accessor :headers, :row

  def initialize headers, row
    @headers = headers
    @row = row
  end

  def method_missing name, *args
    index = @headers.index name.to_s
    return @row[index] unless index == nil
    
    puts "[Warning] column \"#{name}\" is not found"
  end
end

module ActsAsCsv
  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods 
    def act_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def read
      @csv_contents = []

      filename = self.class.to_s.downcase + '.txt'
      file = File.new filename

      @headers = file.gets.chomp.split ', '
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each &block
      @csv_contents.each do |row|
        csv_row = CsvRow.new @headers, row 
        block.call csv_row
      end
    end
  end
end

class ExampleCsv
  include ActsAsCsv
  act_as_csv
end

m = ExampleCsv.new
m.each do |row|
  puts "one: #{row.one}"
  puts "two: #{row.two}"
end