require 'rest-client'
require 'json'
require 'pry'

def get_character_names(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character_films = []
  response_hash["results"].each do |character|
    if character_name == character['name'].downcase
      character['films'].each do |film|
        character_films << film
      end
    end
  end
  character_films
end

def get_character_movies_from_api(character_name)
  character_films = get_character_names(character_name)
  character_films.map do |film| 
    character_response_string = RestClient.get(film) 
    character_response_hash = JSON.parse(character_response_string)
  end
end

def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index + 1}. #{film['title']}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
