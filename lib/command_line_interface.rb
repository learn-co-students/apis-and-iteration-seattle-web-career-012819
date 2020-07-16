# star_wars_api = "https://swapi.co/api/"

def welcome
  puts "Welcome Star Wars Fans!"
  get_character_from_user
end

def get_character_from_user

  puts "Please select a Star Wars Character:"
  puts "(If your stuck, try Leia Organa, C-3PO or Darth Vader.)"
  puts
  # use gets to capture the user's input. This method should return that input, downcased.
  input = STDIN.gets.chomp
  get_character_movies_from_api(input)
end
