require 'rest-client'
require 'json'
require 'pry'

# def working_hash(url_as_string)
#   response_string = RestClient.get(url_as_string)
#   response_hash = JSON.parse(response_string)
# end

# def get_character_movies_from_api(character_name)
#   #make the web request
#   response_hash = working_hash("http://www.swapi.co/api/people/")
#   movies = nil
#   response_hash.each do |key, value|
#     if key == "results"
#       value.each_with_index do |hash, index|
#         # binding.pry
#         hash.each do |categ, detail|
#         if detail == character_name
#           # binding.pry
#           movies = response_hash[key][index]["films"]
#         end
#       end
#       end
#     end
#   end
#   puts movies
#   # binding.pry
# end

def search_for(data_hash, find_key, find_val, find_detail)
  output = []
  data_hash.each do |hash_key, hash_val|
    if hash_key == "results"
      hash_val.each do |array_index|
        array_index.each do |nest_key, nest_val|
          if nest_key == find_key
            # We convert values to strings to simplify checking numbers AND strings.
            if nest_val.to_s.downcase == find_val.to_s.downcase
              # If we have passed in the optional "find_detail" value...
              if !!(find_detail)
                # Give it precedence and only return that detail.
                output << array_index[find_detail]
              else
                # Otherwise return all data for this character.
                output << array_index
              end
            end
          end
        end
      end
    end
  end
  # If we have more than one match, return an array.
  # If we have an empty array, return nil.
  # If we only have one item in the array, return the item itself.
  output = (output.length > 1) ? output : (output.length < 1) ? nil : output.first
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_movies = search_for(response_hash, "name", character_name, "films")

  # We can directly generate the array of movie details inside of character_movies
  character_movies.map { |film_url|
    JSON.parse( RestClient.get( film_url ) )
  }
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each_with_index do |film_item, index|
    film_item.each do |film_key, film_val|
      if film_key.downcase == "title"
        # Indent the movies with a tab character (\t)
        # Also place each movie on a new line (\n)
        print "\t#{index+1}. #{film_val}\n"
      end
    end
  end
  # Pad the output for the next message (ask user if they want to exit, etc)
  print "\n"
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print "#{character.capitalize} has appeared in the following films:\n\n"
  print_movies(films)
  print "Would you like to select another character? (y or n):"
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
