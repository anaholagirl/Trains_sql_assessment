require './lib/train.rb'
require './lib/station.rb'
require 'pg'

DB = PG.connect({:dbname => 'train_system'})

def main_menu
  loop do
    puts "\n\n ******* MAIN MENU ******** \n\n"
    puts "Press ['s'] if you are a member of the train system staff"
    puts "Press ['p'] if you are a train passenger"
    puts "Press ['x'] to exit the system"
    menu_choice = gets.chomp.downcase
    if menu_choice == 's'
      system_menu
    elsif menu_choice == 'p'
      passenger_menu
    elsif menu_choice == 'x'
      puts "Goodbye!"
      exit
    else
      puts "That is not a valid option."
    end
  end
end

def system_menu
  loop do
    puts "\n\n ******* SYSTEM MENU ******** \n\n"
    puts "Press ['t'] to add a train line"
    puts "Press ['s'] to add a station"
    puts "Press ['as'] to add a stop to a train line"
    puts "Press ['at'] to add a train line to a station"
    puts "Press ['rt'] to remove a train line"
    puts "Press ['rs'] to remove a station"
    puts "Press ['m'] to go back to the main menu"
    menu_choice = gets.chomp.downcase
    if menu_choice == 't'
      add_train
    elsif menu_choice == 's'
      add_station
    elsif menu_choice == 'as'
      add_train_stop
    elsif menu_choice == 'at'
      add_station_line
    elsif menu_choice == 'rt'
      remove_train
    elsif menu_choice == 'rs'
      remove station
    elsif menu_choice == 'm'
      main_menu
    else
      puts "That is not a valid option."
    end
  end
end

def passenger_menu
  loop do
    puts "\n\n ******* PASSENGER MENU ******** \n\n"
    puts "Press ['l'] to list all trains lines in the system_menu"
    puts "Press ['v'] to view all the stations in the system"
    puts "Press ['stops'] to see all the stops in a train line"
    puts "Press ['lines'] to see all the train lines going to a station"
    puts "Press ['m'] to go back to main menu"
    menu_choice = gets.chomp.downcase
    if menu_choice == 'l'
      list_trains
    elsif menu_choice == 'v'
      list_stations
    elsif menu_choice == 'stops'
      list_stops
    elsif menu_choice == 'lines'
      list_lines
    elsif menu_choice == 'm'
      main_menu
    else
      puts "That is not a valid option."
    end
  end
end

def add_train
  puts "What is the name of the train you would like to add?"
  train_name = gets.chomp
  new_train = Train.new({:name => train_name})
  new_train.save
  puts "New Train Created!"
  main_menu
end

def add_station
  puts "What is the name of the station you would like to add?"
  station_name = gets.chomp
  new_station = Station.new({:name => station_name})
  new_station.save
  puts "New Station Created!"
  main_menu
end

def add_train_stop
  list_trains
  puts "\n\n"
  puts "What is the name of the train you would like to add a stop to?"
  train_name = gets.chomp
  puts "\n\n"
  list_stations
  puts "What is the name of the station you would like to add as a stop?"
  station_name = gets.chomp
  found_train = Train.find(train_name)
  found_station = Station.find(station_name)
  binding.pry
  found_train.add_stop(found_station)
  "\n\n"
  puts "Your train stop has been added!"
end

def list_trains
  puts "\n\nHere is a list of all the trains in the system.\n\n"
  Train.all.each do |train|
    puts train.name
  end
end

def list_stations
  puts "Here is a list of all current stations in the system."
  Station.all.each do |station|
    puts station.name
  puts "\n\n"
  end
end

def list_stops
  puts "Here is a list of all the trains in this system."
  puts "\n\n"
  list_trains
  puts "What is the name of the train you would like to see the stops for?"
  chosen_train = gets.chomp
  puts "\n\n"
  puts "Here is a list of all the stops for '#{chosen_train}'."
  found_train = Train.find(chosen_train)
  results = found_train.stops
  results.each do |result|
    puts result.name
  end
end

main_menu



