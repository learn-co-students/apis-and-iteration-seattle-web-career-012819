require 'rest-client'
require 'json'
require 'pry'

def get_drinks_by_liquor(liquor)
  drinks = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{liquor}")
  drinks_parsed = JSON.parse(drinks)
  drink_names = drinks_parsed["drinks"].map do |drink|
    drink["strDrink"]
  end
  puts drink_names
end