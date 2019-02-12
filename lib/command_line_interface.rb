def welcome
  puts "Welcome to the cocktail database. Please select an option:"
  puts "1. Find all drinks you can make with a certain liquor"
  puts "2. Find a recipe for a specific drink."
end

# def get_drinks_by_liquor(liquor)
#   drink_names = []
#   JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{liquor}"))
  
# end

def get_drink_details_by_drink_id(id)
  JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"))
end

def get_all_drink_data
  #find all drinks you can make with vodka
end