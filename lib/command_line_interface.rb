def welcome
  intro = <<~INTRO
      8888888888  888    88888
      88     88   88 88   88  88
      8888  88  88   88  88888
          88 88 888888888 88   88
    88888888  88 88     88 88    888888

    88  88  88   888    88888    888888
    88  88  88  88 88   88  88  88
    88 8888 88 88   88  88888    8888
    888  888 888888888 88   88     88
    88  88  88     88 88    8888888


 INTRO

 puts intro
end

def cli_loop
  puts "Welcome to the Star Wars Info Guide!"
  characters = fetch_list_characters
  while true
    puts
    puts "Please enter your favorite character's name, or"
    puts "Type 'exit' to escape, and 'list' for a list of characters!"
    response = gets.chomp
    if response.downcase == "exit"
      break
    elsif response.downcase == "list"
      puts characters
    else
      if characters.include?(response)
        # binding.pry
        get_character_movies_from_api(response)
      else
        puts
        puts "Sorry, we couldn't find a character by that name"
      end
    end
  end
end

# def get_character_from_user

#   gets.chomp
# end

def fetch_list_characters
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character = response_hash["results"].map {|char| char["name"]}
end
