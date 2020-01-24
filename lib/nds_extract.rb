$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  director_data[:movies].reduce(0) do |sum,data|
    sum + data[:worldwide_gross]
  end
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)

  result = {}
  nds.each do |datum|
    result[datum[:name]] = gross_for_director(datum)
  end
  result
end
