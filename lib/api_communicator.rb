require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_data = response_hash['results'].find {|person| person['name'].downcase == character_name}
  puts "Your search for #{character_name} returned the following data:"
  puts "Name: #{character_name}"
  puts "Height: #{character_data['height']}"
  puts "Mass: #{character_data['mass']}"
  puts "Hair Color: #{character_data['hair_color']}"
  puts "Skincolor: #{character_data['skin_color']}"
  puts "Eyecolor: #{character_data['eye_color']}"
  puts "Birth Year: #{character_data['birth_year']}"
  puts "Gender: #{character_data['gender']}"
  homeworld = JSON.parse(RestClient.get(character_data['homeworld']))['name']
  puts "Homeworld: #{homeworld}"
  print_movies(character_data['films'])
  
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  puts "Films this character has appeared in:"
  films.collect.with_index { |film, index| 
    film_data = JSON.parse(RestClient.get(film))
    puts "#{index + 1}. #{film_data['title']} - Year: #{film_data['release_date'].slice(0,4)}"
  }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
