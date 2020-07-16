def main_function
  system("clear")
  welcome
  character = get_character_from_user
  show_character_movies(character)
end

def welcome
  print "Once upon a time, in a galaxy far, far away...\n\n"
  print "   ██████ ██  ███   \n"
  print "  █   █   ██  █  █  \n"
  print "   █  █  █  █ ███   \n"
  print "    █ █  ████ █  █  \n"
  print "████  █  █  █ █   ██\n"
  print "\n"
  print "█ ██ █  ██  ███   ██\n"
  print "█ ██ █  ██  █  █ █  \n"
  print "█ ██ █ █  █ ███   █ \n"
  print " █  █  ████ █  █   █\n"
  print " █  █  █  █ █   ███ \n"
  print "\n"
  print "Welcome to the STAR WARS API!\n\n"
end

def goodbye
  system("clear")
  print "Thank you for using the Star Wars API. Goodbye!\n"
end

def get_character_from_user
  puts "Please enter a character name:"
  gets.chomp.downcase
end

def get_yes_or_no_from_user
  print "Would you like to select another character? (y or n):"
  decision = gets.chomp.downcase
  if decision == "y"
    return main_function
  elsif decision == "n"
    return goodbye
  else
    print "Sorry, I didn't understand that command.\n"
    return get_yes_or_no_from_user
  end
end

