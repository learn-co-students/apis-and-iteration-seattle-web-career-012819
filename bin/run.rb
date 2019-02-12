#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
selection = gets.chomp
if selection == "1"
  puts "Please enter a type of liquor."
  liquor = gets.chomp
  puts get_drinks_by_liquor(liquor)
end
# puts get_drinks_by_liquor("Gin")

