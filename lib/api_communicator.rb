require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  character_name = "Luke Skywalker"
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  
  character = response_hash["results"].find {|char| char["name"] == character_name}
  
  films_JSON = character["films"].map {|film| JSON.parse(RestClient.get(film))}
  
  print_movies(films_JSON)

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
  films.each do |film|
    puts puts
    puts film["title"]
    puts "Directed by " + film["director"]
    puts "Produced by " + film["producer"]
    puts "Released " + film["release_date"]
    puts
    puts film["opening_crawl"]
  end
  nil
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
